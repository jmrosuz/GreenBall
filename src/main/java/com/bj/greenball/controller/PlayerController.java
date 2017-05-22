package com.bj.greenball.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bj.greenball.model.Category;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;
import com.bj.greenball.service.CategoryService;
import com.bj.greenball.service.PlayerService;
import com.bj.greenball.service.TournamentService;
import com.bj.greenball.util.XlsReader;



/**
 * Handles requests for the application home page.
 */
@Controller
public class PlayerController {
	
	private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);
	private static final String UPLOAD_DIRECTORY ="/resources/tempFiles";  
	
	private PlayerService playerService;
	private TournamentService tournamentService;
	private CategoryService categoryService;

	
	
	@Autowired(required=true)
	@Qualifier(value="playerService")
	public void setPlayerService(PlayerService ps){
		this.playerService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="tournamentService")
	public void setTournamentService(TournamentService ps){
		this.tournamentService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="categoryService")
	public void setCategoryService(CategoryService ps){
		this.categoryService = ps;
	}
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "home";
//	}
	
	@RequestMapping(value = "/players", method = RequestMethod.GET)
	public ModelAndView listPersons() {
		
		List<Category> mensCategoriesS = new ArrayList<Category>();
		List<Category> nvmensCategoriesS = new ArrayList<Category>();
		List<Category> mensCategoriesD = new ArrayList<Category>();
		List<Category> nvmensCategoriesD = new ArrayList<Category>();
		List<Category> womansCategoriesS = new ArrayList<Category>();
		List<Category> nvwomansCategoriesS = new ArrayList<Category>();
		List<Category> womansCategoriesD = new ArrayList<Category>();
		List<Category> nvwomansCategoriesD = new ArrayList<Category>();
		List<Category> mixesCategories = new ArrayList<Category>();
		List<Category> nvmixesCategories = new ArrayList<Category>();
		
		ModelAndView model = new ModelAndView("players");
		model.addObject("player", new Player());
		model.addObject("badRows", "");
		model.addObject("listPlayers", this.playerService.listPlayer(1));
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Set<Category> categories = this.tournamentService.getTournamentByShortName("JMTOR").getCategories();
		Iterator<Category> iterator = categories.iterator();
	    while(iterator.hasNext()) {
	        Category cat = iterator.next();
	        String sex = cat.getSex();
	        if (sex.equals("M")){
	        	mensCategoriesS.add(cat);
	        }
	        else if (sex.equals("MD")){
	        	mensCategoriesD.add(cat);
	        }
	        else if (sex.equals("NVM")){
	        	nvmensCategoriesS.add(cat);
	        }
	        else if (sex.equals("NVMD")){
	        	nvmensCategoriesD.add(cat);
	        }
	        else if (sex.equals("W")){
	        	womansCategoriesS.add(cat);
	        }
	        else if (sex.equals("WD")){
	        	womansCategoriesD.add(cat);
	        }
	        else if (sex.equals("NVW")){
	        	nvwomansCategoriesS.add(cat);
	        }
	        else if (sex.equals("NVWD")){
	        	nvwomansCategoriesD.add(cat);
	        }
	        else if (sex.equals("MIX")){
	        	mixesCategories.add(cat);
	        }
	        else if(sex.equals("NVMIX")){
	        	nvmixesCategories.add(cat);
	        }
	    }
	    
	    model.addObject("mensCategoriesS", mensCategoriesS);
	    model.addObject("mensCategoriesD", mensCategoriesD);
	    model.addObject("nvmensCategoriesS", nvmensCategoriesS);
	    model.addObject("nvmensCategoriesD", nvmensCategoriesD);
	    model.addObject("womansCategoriesS", womansCategoriesS);
	    model.addObject("womansCategoriesD", womansCategoriesD);
	    model.addObject("nvwomansCategoriesS", nvwomansCategoriesS);
	    model.addObject("nvwomansCategoriesD", nvwomansCategoriesD);
	    model.addObject("mixesCategories", mixesCategories);
	    model.addObject("nvmixesCategories", nvmixesCategories);
		
		return model;
	}
	
	
	@RequestMapping(value = "/addPlayers", method = RequestMethod.POST, params="borrarTodo")
	public ModelAndView deletePlayers() {
		Tournament t = null;
		ModelAndView model = new ModelAndView("players");
		
			t = this.tournamentService.getTournamentById(1);
			Set<Player> allPlayers = new HashSet<Player>();
			Iterator<Player> iterator = t.getPlayers().iterator();
		    while(iterator.hasNext()) {
		        Player pT = iterator.next();
		        allPlayers.add(pT);
		            iterator.remove();
		    }
		    
		    this.tournamentService.updateTournament(t);
		    
		    Iterator<Player> iterator2 = t.getPlayers().iterator();
		    while(iterator2.hasNext()) {
		        Player pT2 = iterator2.next();
		        this.playerService.removePlayer(pT2.getIdPlayer());
		        
		    }
			
			model.addObject("player", new Player());
			model.addObject("listPlayers", this.playerService.listPlayer(1));
		
		
		model.setViewName("redirect:/players");
		
		return model;
	}
	
	@RequestMapping(value="/addPlayers",params="cancelar",method=RequestMethod.POST)
    public ModelAndView cancelar()
    {
		ModelAndView model = new ModelAndView("players");
		model.addObject("player", new Player());
		model.addObject("listPlayers", this.playerService.listPlayer(1));
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.setViewName("redirect:/players");
		
		return model;
    }

	@RequestMapping(value= "/addPlayers", method = RequestMethod.POST)
	public   ModelAndView addPerson(@Valid @ModelAttribute("player")  Player p,  BindingResult result, HttpServletRequest request){
		Tournament t = null;
		ModelAndView model = new ModelAndView("players");
		
		String s = request.getParameter("singlesCategory");
		String d = request.getParameter("doublesCategory");
		String m = request.getParameter("mixesCategory");
		
		if (s!= null && !s.equals("")){
			p.setSinglesCategory(this.categoryService.getCategoryById(Integer.valueOf(s)));
		}
		if (d!= null && !d.equals("")){
			p.setDoublesCategory(this.categoryService.getCategoryById(Integer.valueOf(d)));
		}
		if (m!= null && !m.equals("")){
			p.setMixesCategory(this.categoryService.getCategoryById(Integer.valueOf(m)));
		}
		
		result.recordSuppressedField("singlesCategory");
		int contador = 0;
		if (result.hasErrors())
		{
			List<ObjectError> x =result.getAllErrors();
			for (int a = 0;a<x.size();a++ ){
				if (x.get(a).getDefaultMessage().contains("singlesCategory") ){
					contador = contador +1;
				}
				else if (x.get(a).getDefaultMessage().contains("doublesCategory") ){
					contador = contador +1;
				}
				else if (x.get(a).getDefaultMessage().contains("mixesCategory") ){
					contador = contador +1;
				}
				else{
					contador = 0;
					break;
				}
			}
			if (contador== 0){
			model.setViewName("players");
			model.addObject("player", p);
			model.addObject("listPlayers", this.playerService.listPlayer(1));
			model.addObject("hasError", " has-error");
			
			List<Category> mensCategoriesS = new ArrayList<Category>();
			List<Category> nvmensCategoriesS = new ArrayList<Category>();
			List<Category> mensCategoriesD = new ArrayList<Category>();
			List<Category> nvmensCategoriesD = new ArrayList<Category>();
			List<Category> womansCategoriesS = new ArrayList<Category>();
			List<Category> nvwomansCategoriesS = new ArrayList<Category>();
			List<Category> womansCategoriesD = new ArrayList<Category>();
			List<Category> nvwomansCategoriesD = new ArrayList<Category>();
			List<Category> mixesCategories = new ArrayList<Category>();
			List<Category> nvmixesCategories = new ArrayList<Category>();
			
			
			Set<Category> categories = this.tournamentService.getTournamentByShortName("JMTOR").getCategories();
			Iterator<Category> iterator = categories.iterator();
		    while(iterator.hasNext()) {
		        Category cat = iterator.next();
		        String sex = cat.getSex();
		        if (sex.equals("M")){
		        	mensCategoriesS.add(cat);
		        }
		        else if (sex.equals("MD")){
		        	mensCategoriesD.add(cat);
		        }
		        else if (sex.equals("NVM")){
		        	nvmensCategoriesS.add(cat);
		        }
		        else if (sex.equals("NVMD")){
		        	nvmensCategoriesD.add(cat);
		        }
		        else if (sex.equals("W")){
		        	womansCategoriesS.add(cat);
		        }
		        else if (sex.equals("WD")){
		        	womansCategoriesD.add(cat);
		        }
		        else if (sex.equals("NVW")){
		        	nvwomansCategoriesS.add(cat);
		        }
		        else if (sex.equals("NVWD")){
		        	nvwomansCategoriesD.add(cat);
		        }
		        else if (sex.equals("MIX")){
		        	mixesCategories.add(cat);
		        }
		        else if(sex.equals("NVMIX")){
		        	nvmixesCategories.add(cat);
		        }
		    }
		    
		    model.addObject("mensCategoriesS", mensCategoriesS);
		    model.addObject("mensCategoriesD", mensCategoriesD);
		    model.addObject("nvmensCategoriesS", nvmensCategoriesS);
		    model.addObject("nvmensCategoriesD", nvmensCategoriesD);
		    model.addObject("womansCategoriesS", womansCategoriesS);
		    model.addObject("womansCategoriesD", womansCategoriesD);
		    model.addObject("nvwomansCategoriesS", nvwomansCategoriesS);
		    model.addObject("nvwomansCategoriesD", nvwomansCategoriesD);
		    model.addObject("mixesCategories", mixesCategories);
		    model.addObject("nvmixesCategories", nvmixesCategories);
			
			
			
			
			}
			else{
				if (p.getIdPlayer()==0){ 
					t = this.tournamentService.getTournamentById(1);
					t.getPlayers().add(p);
					this.tournamentService.updateTournament(t);
					model.addObject("player", new Player());
					model.addObject("listPlayers", this.playerService.listPlayer(1));
				}
				else{
					this.playerService.updatePlayer(p);
					
					model.setViewName("redirect:/players");
				}
				
			}
			
			return model;
			
		}
		else{
			
			
			if (p.getIdPlayer()==0){ 
				t = this.tournamentService.getTournamentById(1);
				t.getPlayers().add(p);
				this.tournamentService.updateTournament(t);
				model.addObject("player", new Player());
				model.addObject("listPlayers", this.playerService.listPlayer(1));
			}
			else{
				this.playerService.updatePlayer(p);
				
				model.setViewName("redirect:/players");
			}
			
		}
		
		
		
		return model;
		
	}
	
	@RequestMapping(value= "/editPlayer/{idPlayer}", method = RequestMethod.GET)
	public String  editPlayer(@PathVariable int idPlayer,  Model model){
		Player player = this.playerService.getPlayerById(idPlayer);
		model.addAttribute("player", player);
		model.addAttribute("listPlayers", this.playerService.listPlayer(1));
		
		
		
		
		List<Category> mensCategoriesS = new ArrayList<Category>();
		List<Category> nvmensCategoriesS = new ArrayList<Category>();
		List<Category> mensCategoriesD = new ArrayList<Category>();
		List<Category> nvmensCategoriesD = new ArrayList<Category>();
		List<Category> womansCategoriesS = new ArrayList<Category>();
		List<Category> nvwomansCategoriesS = new ArrayList<Category>();
		List<Category> womansCategoriesD = new ArrayList<Category>();
		List<Category> nvwomansCategoriesD = new ArrayList<Category>();
		List<Category> mixesCategories = new ArrayList<Category>();
		List<Category> nvmixesCategories = new ArrayList<Category>();
		
		
		
		
		Set<Category> categories = this.tournamentService.getTournamentByShortName("JMTOR").getCategories();
		Iterator<Category> iterator = categories.iterator();
	    while(iterator.hasNext()) {
	        Category cat = iterator.next();
	        String sex = cat.getSex();
	        if (sex.equals("M")){
	        	mensCategoriesS.add(cat);
	        }
	        else if (sex.equals("MD")){
	        	mensCategoriesD.add(cat);
	        }
	        else if (sex.equals("NVM")){
	        	nvmensCategoriesS.add(cat);
	        }
	        else if (sex.equals("NVMD")){
	        	nvmensCategoriesD.add(cat);
	        }
	        else if (sex.equals("W")){
	        	womansCategoriesS.add(cat);
	        }
	        else if (sex.equals("WD")){
	        	womansCategoriesD.add(cat);
	        }
	        else if (sex.equals("NVW")){
	        	nvwomansCategoriesS.add(cat);
	        }
	        else if (sex.equals("NVWD")){
	        	nvwomansCategoriesD.add(cat);
	        }
	        else if (sex.equals("MIX")){
	        	mixesCategories.add(cat);
	        }
	        else if(sex.equals("NVMIX")){
	        	nvmixesCategories.add(cat);
	        }
	    }
	    
	    if (player.getSinglesCategory()!= null ){
	    	System.out.println("Comparando: "+ player.getSinglesCategory().getName());
	    	if (player.getSinglesCategory().getSex().equals("M")){
	    		model.addAttribute("singlesAvailable", mensCategoriesS);
	    	}
	    	else if (player.getSinglesCategory().getSex().equals("W")){
	    		model.addAttribute("singlesAvailable", womansCategoriesS);
	    	}
	    	else if (player.getSinglesCategory().getSex().equals("NVW")){
	    		System.out.println("Si entro al ir correcto");
	    		model.addAttribute("singlesAvailable", nvwomansCategoriesS);
	    	}
	    	else if (player.getSinglesCategory().getSex().equals("NVM")){
	    		model.addAttribute("singlesAvailable", nvmensCategoriesS);
	    	}
		}
	    
	    if (player.getDoublesCategory()!= null ){
	    	if (player.getDoublesCategory().getSex().equals("MD")){
	    		model.addAttribute("doublesAvailable", mensCategoriesD);
	    	}
	    	else if (player.getDoublesCategory().getSex().equals("WD")){
	    		model.addAttribute("doublesAvailable", womansCategoriesD);
	    	}
	    	else if (player.getDoublesCategory().getSex().equals("NVWD")){
	    		model.addAttribute("doublesAvailable", nvwomansCategoriesD);
	    	}
	    	else if (player.getDoublesCategory().getSex().equals("NVMD")){
	    		model.addAttribute("doublesAvailable", nvmensCategoriesD);
	    	}
		}
	    
	    if (player.getMixesCategory()!= null ){
	    	if (player.getMixesCategory().getSex().equals("mix")){
	    		model.addAttribute("mixesAvailable", mixesCategories);
	    	}
	    	else if (player.getMixesCategory().getSex().equals("NVMIX")){
	    		model.addAttribute("mixesAvailable", nvmixesCategories);
	    	}
		}
	    
	    model.addAttribute("mensCategoriesS", mensCategoriesS);
	    model.addAttribute("mensCategoriesD", mensCategoriesD);
	    model.addAttribute("nvmensCategoriesS", nvmensCategoriesS);
	    model.addAttribute("nvmensCategoriesD", nvmensCategoriesD);
	    model.addAttribute("womansCategoriesS", womansCategoriesS);
	    model.addAttribute("womansCategoriesD", womansCategoriesD);
	    model.addAttribute("nvwomansCategoriesS", nvwomansCategoriesS);
	    model.addAttribute("nvwomansCategoriesD", nvwomansCategoriesD);
	    model.addAttribute("mixesCategories", mixesCategories);
	    model.addAttribute("nvmixesCategories", nvmixesCategories);
	    
		
		return "players";
		
	}
	
	@RequestMapping(value= "/removePlayer/{idPlayer}", method = RequestMethod.GET)
	public   ModelAndView removePlayer(Model modelm, @PathVariable int idPlayer){
		Tournament t = null;
		ModelAndView model = new ModelAndView("players");
		
		
			t = this.tournamentService.getTournamentById(1);
			
			Iterator<Player> iterator = t.getPlayers().iterator();
		    while(iterator.hasNext()) {
		        Player pT = iterator.next();
		        if(pT.getIdPlayer()==idPlayer) {
		            iterator.remove();
		        }
		    }
			
			
			this.tournamentService.updateTournament(t);
			this.playerService.removePlayer(idPlayer);
			
			model.addObject("player", new Player());
			model.addObject("listPlayers", this.playerService.listPlayer(1));
		
		
		model.setViewName("redirect:/players");
		
		return model;
		
	}
	
	@RequestMapping(value="addPlayers",method=RequestMethod.POST, params="uploadFile")  
    public ModelAndView saveFile( @RequestParam CommonsMultipartFile file,  
           HttpSession session) throws Exception{ 
    	    
  
    ServletContext context = session.getServletContext();  
    //String path = context.getRealPath(UPLOAD_DIRECTORY);
    
    String path = "C:/mytemp";
    String filename = file.getOriginalFilename();  
  
    ModelAndView model = new ModelAndView("players");
	model.addObject("player", new Player());
	
	if (filename == null ||filename.equals("")){
		model.addObject("listPlayers", this.playerService.listPlayer(1));
		model.setViewName("redirect:/players");
		return model;
	}
    
  
    byte[] bytes = file.getBytes();  
    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
         new File(path + File.separator + filename)));
    stream.write(bytes);  
    stream.flush();  
    stream.close();  
    
    XlsReader xlsReader = new XlsReader();
    Set<Player> players = xlsReader.readFile(path  + File.separator + filename);
    
    if (xlsReader.erroneos.size()>0){
    	String badRows = "";
    	for (int a = 0; a<xlsReader.erroneos.size();a++)
    	{
    		badRows.concat(xlsReader.erroneos.get(a).toString());
    		badRows.concat(", ");
    	}
    	
    	model.addObject("badRows", xlsReader.erroneos);
    }
    
    String badRows = "2,3,4,5,";
    model.addObject("badRows", badRows);
    
    Tournament t = this.tournamentService.getTournamentById(1);
	
    
	Iterator<Player> iterator = players.iterator();
	 while(iterator.hasNext()) {
	        Player pT = iterator.next();
	        t.getPlayers().add(pT);
	    }
	 
	 this.tournamentService.updateTournament(t);
    
    
    
	model.addObject("listPlayers", this.playerService.listPlayer(1));
           
    return model;  
    }
	

	
}
