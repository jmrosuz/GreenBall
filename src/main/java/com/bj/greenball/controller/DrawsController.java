package com.bj.greenball.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
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
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.codehaus.jackson.type.TypeReference;
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
import com.bj.greenball.model.Groups;
import com.bj.greenball.model.Match;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;
import com.bj.greenball.model.TournamentDetCategoriesId;
import com.bj.greenball.model.TournamentDetails;
import com.bj.greenball.service.CategoryService;
import com.bj.greenball.service.GroupsService;
import com.bj.greenball.service.MatchService;
import com.bj.greenball.service.PlayerService;
import com.bj.greenball.service.TournamentDetCategoriesIdService;
import com.bj.greenball.service.TournamentDetailsService;
import com.bj.greenball.service.TournamentService;
import com.bj.greenball.util.XlsReader;



/**
 * Handles requests for the application home page.
 */
@Controller
public class DrawsController {
	
	private static final Logger logger = LoggerFactory.getLogger(DrawsController.class);
	private static final String UPLOAD_DIRECTORY ="/resources/tempFiles";  
	
	private PlayerService playerService;
	private TournamentService tournamentService;
	private TournamentDetailsService tournamentDetailsService;
	private CategoryService categoryService;
	private MatchService matchService;
	private GroupsService groupsService;
	private TournamentDetCategoriesIdService tournamentDetCategoriesIdService;
	
	private String mode="SM";
	private String superMode ="S";
	

	
	
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
	@Qualifier(value="tournamentDetailsService")
	public void setTournamentDetailsService(TournamentDetailsService ps){
		this.tournamentDetailsService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="categoryService")
	public void setCategoryService(CategoryService ps){
		this.categoryService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="tournamentDetCategoriesIdService")
	public void setTournamentDetCategoriesIdService(TournamentDetCategoriesIdService ps){
		this.tournamentDetCategoriesIdService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="matchService")
	public void setMatchService(MatchService ps){
		this.matchService = ps;
	}
	
	@Autowired(required=true)
	@Qualifier(value="groupsService")
	public void setGroupService(GroupsService ps){
		this.groupsService = ps;
	}
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/test", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/draws", method = RequestMethod.GET)
	public ModelAndView pruebas(Locale locale, HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("draws");
		
		
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		model.addObject("currentMode", this.mode);
		model.addObject("currentSuperMode", this.superMode);
		this.mode ="SM";
		this.superMode = "S";
		
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
		
Tournament t =this.tournamentService.getTournamentByShortName("JMTOR"); 
		
		Set<Category> categories = t.getCategories();
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
	    
	    model.addObject("mAvailable", new ArrayList<Player>());
		
		return model;
	}
	
	@RequestMapping(value = "/draws", method = RequestMethod.POST)
	public String fillPlayers( HttpServletRequest request,  Model model) {
		
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String cm = request.getParameter("currentMode");
		String sm = request.getParameter("currentSuperMode");
		String category = request.getParameter("category");
		String isAuto = request.getParameter("isAuto");
		String isSave = request.getParameter("isSave");
		String isSave2 = request.getParameter("isSave2");
		String times= request.getParameter("mapTimes");
		String dates= request.getParameter("mapDates");
		String fields= request.getParameter("mapFields");
		String tab= request.getParameter("tab");
		String[] orderedPlayers2 = null;
		if (isSave != null && isSave.length()>0){
			String[] orderedPlayers = isSave.split(",");
			if (isSave2 != null && isSave2.length()>0){
				orderedPlayers2 = isSave2.split(",");
			}
			Category cat = this.categoryService.getCategoryById(Integer.parseInt(category));
			int tournamentDetailsId = this.tournamentDetCategoriesIdService.getTournamentDetailsByCategory(Integer.parseInt(category));
			TournamentDetails td = this.tournamentDetailsService.getTournamentDetailsById(tournamentDetailsId);
			
			List<Match> matches = this.matchService.listMatchByTourCat(td.getId(),Integer.parseInt(category));
			for (int k=0;k<matches.size();k++){
				this.matchService.removeMatch(matches.get(k).getId());
			}
			List<Groups> g = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
			if (g != null){
				for (int p=0;p<g.size();p++){
					this.groupsService.removeGroup(g.get(p).getId());
				}
			}
			
			if (td.getFormat().equals("MD")){
				
				Match mtemp = matchService.getMaxMatchNumber(td.getId(), Integer.parseInt(category));
				if (mtemp != null){
					System.out.println("Match mas alto:" + mtemp.getMatchNumber());
				}
			
			int f=1;
			int p =2;
			if (isSave2 != null){
				p = 4;
			}
			for (int i = 0; i < orderedPlayers.length; i+=p) {
				
				Player player1= new Player();
				Player player2= new Player();
				Player player1d= new Player();
				Player player2d= new Player();
				
				if (isSave2 != null){
					 player1= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i]));
					 player1d= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i+1]));
					 player2= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i+2]));
					 player2d= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i+3]));
				}
				else{
					 player1= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i]));
					 player2= this.playerService.getPlayerById(Integer.parseInt(orderedPlayers[i+1]));
				}
				
				System.out.println(orderedPlayers[i]);
				System.out.println(orderedPlayers[i+1]);
				
				System.out.println("-------------------------------------");
			
					Match match = new Match();
					match.setPlayer1(player1);
					match.setPlayer2(player2);
					if (isSave2 != null){
						match.setPlayer1d(player1d);
						match.setPlayer2d(player2d);
					}
					match.setCategory(cat);
					match.setTournamentDetailId(td);
					match.setMatchNumber(f);
					match.setRound(1);
					
					System.out.println("TIMES:" + times);
					
					if (times != null){
						ObjectMapper myMapper = new ObjectMapper();
						TypeReference<HashMap<String, Object>> typeRef = new TypeReference<HashMap<String, Object>>() { };
						try {
							Map<String, Object> myMapTimes = myMapper.readValue(times, typeRef);
							Map<String, Object> myMapDates = myMapper.readValue(dates, typeRef);
							Map<String, Object> myMapFields = myMapper.readValue(fields, typeRef);
							
							SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
							String fecha = (String)myMapDates.get(String.valueOf(f)) + " " + (String)myMapTimes.get(String.valueOf(f)); 
							Date parsedDate = dateFormat.parse(fecha);
							Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
							match.setField((String) myMapFields.get(String.valueOf(f)));
							match.setDate(timestamp);
						} catch (JsonParseException e) {
							e.printStackTrace();
						} catch (JsonMappingException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					
					this.matchService.addMatch(match);
				f++;
				
			}
			f=1;
			}
			else if (td.getFormat().equals("RR")){
				ArrayList<ArrayList<String>> arrayGroups = new ArrayList<ArrayList<String>>();
				ArrayList<ArrayList<String>> arrayGroups2 = new ArrayList<ArrayList<String>>();
				//este for genera una arreglo de arreglos, en cada sub arreglo esta el listado de ids de tenistas del grupo
				int groupNumber = 1;
				ArrayList<String> arrayMembers = new ArrayList<String>();
				ArrayList<String> arrayMembers2 = new ArrayList<String>();
				
				for (int a=0;a<orderedPlayers.length;a++){
					
					
					if (a == ((td.getGroupsSize()*groupNumber)-1)){
						arrayMembers.add(orderedPlayers[a]);
						if (isSave2 != null && isSave2.length()>0){
							arrayMembers2.add(orderedPlayers2[a]);
						}
						arrayGroups.add(arrayMembers);
						arrayGroups2.add(arrayMembers2);
						arrayMembers = new ArrayList<String>();
						arrayMembers2 = new ArrayList<String>();
						
						groupNumber = groupNumber + 1;
						
					}
					
					else{
						arrayMembers.add(orderedPlayers[a]);
						if (isSave2 != null && isSave2.length()>0){
							arrayMembers2.add(orderedPlayers2[a]);
						}
					}
				}
				
				int currentMatch = 1;
				for (int b=0;b<arrayGroups.size();b++){
					ArrayList<String> members = arrayGroups.get(b);
					ArrayList<String> members2 = arrayGroups2.get(b);
					for (int c= 0;c<members.size();c++){
						Player playerX = this.playerService.getPlayerById(Integer.parseInt(members.get(c)));
						
						Groups newGroup = new Groups();
						newGroup.setPlayer(playerX);
						newGroup.setCategory(cat);
						newGroup.setTournamentDetailId(td);
						newGroup.setGroup(b+1);
						newGroup.setPosition(c+1);
						
						if (isSave2 != null){
							Player playerX2 = this.playerService.getPlayerById(Integer.parseInt(members2.get(c)));
							newGroup.setPlayerD(playerX2);
						}
						this.groupsService.addGroup(newGroup);
						for (int d =0;d<members.size();d++){
							String idPlayer = members.get(d);
							if (c > d){
								
								//if (!members.get(c).equals("0") && !members.get(d).equals("0")){
									Player player1= this.playerService.getPlayerById(Integer.parseInt(members.get(c)));
									
									Player player2= this.playerService.getPlayerById(Integer.parseInt(members.get(d)));
									
									
									Match match = new Match();
									
									if (isSave2 != null){
										Player player1d= this.playerService.getPlayerById(Integer.parseInt(members2.get(c)));
										Player player2d= this.playerService.getPlayerById(Integer.parseInt(members2.get(d)));
										match.setPlayer1d(player1d);
										match.setPlayer2d(player2d);
										
									}
									
									else {
										match.setPlayer1(player1);
										match.setPlayer2(player2);
									}
									
									match.setCategory(cat);
									match.setTournamentDetailId(td);
									match.setMatchNumber(currentMatch);
									match.setRound(1);
									
									if (times != null){
										ObjectMapper myMapper = new ObjectMapper();
										TypeReference<HashMap<String, Object>> typeRef = new TypeReference<HashMap<String, Object>>() { };
										try {
											Map<String, Object> myMapTimes = myMapper.readValue(times, typeRef);
											Map<String, Object> myMapDates = myMapper.readValue(dates, typeRef);
											Map<String, Object> myMapFields = myMapper.readValue(fields, typeRef);
											
											
											SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
											String fecha = (String)myMapDates.get(String.valueOf(currentMatch)) + " " + (String)myMapTimes.get(String.valueOf(currentMatch)); 
											Date parsedDate = dateFormat.parse(fecha);
											Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
											match.setField((String) myMapFields.get(String.valueOf(currentMatch)));
											match.setDate(timestamp);
										} catch (JsonParseException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										} catch (JsonMappingException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										} catch (IOException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										} catch (ParseException e) {
											// TODO Auto-generated catch block
											e.printStackTrace();
										}
									}
									
								
									this.matchService.addMatch(match);
								
								currentMatch = currentMatch + 1;
							}
						}
						
						
					}
				}
				
			}
			
		}
		
		
		
		
		
		if (cm != null && cm.equals("SM") && category != null){
			model.addAttribute("mscSelected", category);
		}
		else if (cm != null && cm.equals("SMN") && category != null){
			model.addAttribute("mnscSelected", category);
		}
		else if (cm != null && cm.equals("SWN") && category != null){
			model.addAttribute("wnscSelected", category);
		}
		else if (cm != null && cm.equals("SW") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("DM") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("DW") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("DMN") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("DWN") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("MA") && category != null){
			model.addAttribute("wscSelected", category);
		}
		else if (cm != null && cm.equals("MK") && category != null){
			model.addAttribute("wscSelected", category);
		}
		
		
		model.addAttribute("currentMode", cm);
		model.addAttribute("currentSuperMode", sm);
		this.mode ="SM";
		this.superMode = "S";
		
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
		
		Tournament t =this.tournamentService.getTournamentByShortName("JMTOR"); 
		
		Set<Category> categories = t.getCategories();
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
	    
	    
	    List<Player> mAvailable = new ArrayList<Player>();
	    List<Player> mAvailableFinal = new ArrayList<Player>();
	    List<Player> wAvailable = new ArrayList<Player>();
	    List<Player> wAvailableFinal = new ArrayList<Player>();
	    List<Player> mnvAvailable = new ArrayList<Player>();
	    List<Player> mnvAvailableFinal = new ArrayList<Player>();
	    List<Player> wnvAvailable = new ArrayList<Player>();
	    List<Player> wnvAvailableFinal = new ArrayList<Player>();
	    List<Player> mdAvailable = new ArrayList<Player>();
	    List<Player> mdAvailableFinal = new ArrayList<Player>();
	    List<Player> wdAvailable = new ArrayList<Player>();
	    List<Player> wdAvailableFinal = new ArrayList<Player>();
	    List<Player> nvmdAvailable = new ArrayList<Player>();
	    List<Player> nvmdAvailableFinal = new ArrayList<Player>();
	    List<Player> nvwdAvailable = new ArrayList<Player>();
	    List<Player> nvwdAvailableFinal = new ArrayList<Player>();
	    List<Player> maAvailable = new ArrayList<Player>();
	    List<Player> maAvailableFinal = new ArrayList<Player>();
	    List<Player> mkAvailable = new ArrayList<Player>();
	    List<Player> mkAvailableFinal = new ArrayList<Player>();
	    Player emptyPlayer = new Player();
	    emptyPlayer.setName("Bye");
	    emptyPlayer.setIdPlayer(0);
	    int numOfGraphMD = 0;
	    int numOfGraphRR = 0;
	    int numOfGraphMDSMN = 0;
	    int numOfGraphRRSMN = 0;
	    int numOfGraphMDSWN = 0;
	    int numOfGraphRRSWN = 0;
	    int numOfGraphMDSW = 0;
	    int numOfGraphRRSW = 0;
	    int numOfGraphMDDM = 0;
	    int numOfGraphRRDM = 0;
	    int numOfGraphMDDW = 0;
	    int numOfGraphRRDW = 0;
	    int numOfGraphMDDMN = 0;
	    int numOfGraphRRDMN = 0;
	    int numOfGraphMDDWN = 0;
	    int numOfGraphRRDWN = 0;
	    int numOfGraphMDDMA = 0;
	    int numOfGraphRRDMA = 0;
	    int numOfGraphMDDMK = 0;
	    int numOfGraphRRDMK = 0;
	    if (cm != null && cm.equals("SM") && category != null && !category.equals("0")){
	    	mAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SM", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("SM") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
			    			numOfGraphMD =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					mAvailableFinal.add(match.getPlayer1());
			    					mAvailableFinal.add(match.getPlayer2());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			mAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= mAvailable.size()){
				    				int missingPlayers = td.getDrawSize()-mAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					mAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(mAvailable);
				    					for (int c = 0;c<td.getDrawSize();c++){
					    					if (c<mAvailable.size()){
					    						mAvailableFinal.add(mAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						mAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					mAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				mAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SM", Integer.parseInt(category));
		    				numOfGraphRR = roundUp(mAvailable.size(), td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						mAvailableFinal.add(groups.get(f).getPlayer());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					mAvailable.clear();
		    				}
		    				else{
			    				if ((td.getGroupsSize()*numOfGraphRR) > mAvailable.size()){
			    					int missingPlayers = (td.getGroupsSize()*numOfGraphRR) - mAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					mAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(mAvailable);
			    						for (int c=0;c<(mAvailable.size()+missingPlayers);c++){
			    							if (c<mAvailable.size()){
			    								mAvailableFinal.add(mAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								mAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						mAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (mAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", mAvailable.size()/numOfGraphRR);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", mAvailableFinal.size()/numOfGraphRR);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    else if (cm != null && cm.equals("SMN") && category != null && !category.equals("0")){
	    	mnvAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SMN", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("SMN") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
			    			numOfGraphMDSMN =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					mnvAvailableFinal.add(match.getPlayer1());
			    					mnvAvailableFinal.add(match.getPlayer2());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    				mnvAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= mnvAvailable.size()){
				    				int missingPlayers = td.getDrawSize()-mnvAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					mnvAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(mnvAvailable);
				    					for (int c = 0;c<td.getDrawSize();c++){
					    					if (c<mnvAvailable.size()){
					    						mnvAvailableFinal.add(mnvAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						mnvAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					mnvAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				//mnvAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SMN", Integer.parseInt(category));
		    				System.out.println("Tamaño de arreglo:" + mnvAvailable.size());
		    				numOfGraphRRSMN = roundUp(mnvAvailable.size(), td.getGroupsSize());
		    				System.out.println("Tamaño de numOfGraphRRSMN:" + numOfGraphRRSMN);
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						mnvAvailableFinal.add(groups.get(f).getPlayer());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					mnvAvailable.clear();
		    				}
		    				else{
			    				if ((td.getGroupsSize()*numOfGraphRRSMN) > mnvAvailable.size()){
			    					int missingPlayers = (td.getGroupsSize()*numOfGraphRRSMN) - mnvAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
			    							mnvAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(mnvAvailable);
			    						for (int c=0;c<(mnvAvailable.size()+missingPlayers);c++){
			    							if (c<mnvAvailable.size()){
			    								mnvAvailableFinal.add(mnvAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								mnvAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						mnvAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (mnvAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", mnvAvailable.size()/numOfGraphRRSMN);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", mnvAvailableFinal.size()/numOfGraphRRSMN);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    else if (cm != null && cm.equals("SW") && category != null && !category.equals("0")){
	    	wAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SW", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("SW") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
			    			numOfGraphMDSW =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					wAvailableFinal.add(match.getPlayer1());
			    					wAvailableFinal.add(match.getPlayer2());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    				wAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= wAvailable.size()){
				    				int missingPlayers = td.getDrawSize()-wAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					wAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(wAvailable);
				    					for (int c = 0;c<td.getDrawSize();c++){
					    					if (c<wAvailable.size()){
					    						wAvailableFinal.add(wAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						wAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					wAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				//mnvAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SMN", Integer.parseInt(category));
		    				System.out.println("Tamaño de arreglo:" + wAvailable.size());
		    				numOfGraphRRSWN = roundUp(wAvailable.size(), td.getGroupsSize());
		    				System.out.println("Tamaño de numOfGraphRRSMN:" + numOfGraphRRSW);
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						wAvailableFinal.add(groups.get(f).getPlayer());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					wAvailable.clear();
		    				}
		    				else{
			    				if ((td.getGroupsSize()*numOfGraphRRSW) > wAvailable.size()){
			    					int missingPlayers = (td.getGroupsSize()*numOfGraphRRSW) - wAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
			    							wAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(wAvailable);
			    						for (int c=0;c<(wAvailable.size()+missingPlayers);c++){
			    							if (c<wAvailable.size()){
			    								wAvailableFinal.add(wAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								wAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						wAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (wAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", wAvailable.size()/numOfGraphRRSW);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", wAvailableFinal.size()/numOfGraphRRSW);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    else if (cm != null && cm.equals("SWN") && category != null && !category.equals("0")){
	    	wnvAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SWN", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("SWN") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
			    			numOfGraphMDSWN =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					wnvAvailableFinal.add(match.getPlayer1());
			    					wnvAvailableFinal.add(match.getPlayer2());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    				wnvAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= wnvAvailable.size()){
				    				int missingPlayers = td.getDrawSize()-wnvAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					wnvAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(wnvAvailable);
				    					for (int c = 0;c<td.getDrawSize();c++){
					    					if (c<wnvAvailable.size()){
					    						wnvAvailableFinal.add(wnvAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						wnvAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					wnvAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				//mnvAvailable = this.playerService.listPlayerOnCategory(t.getId(), "SMN", Integer.parseInt(category));
		    				System.out.println("Tamaño de arreglo:" + wnvAvailable.size());
		    				numOfGraphRRSWN = roundUp(wnvAvailable.size(), td.getGroupsSize());
		    				System.out.println("Tamaño de numOfGraphRRSMN:" + numOfGraphRRSWN);
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						wnvAvailableFinal.add(groups.get(f).getPlayer());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					wnvAvailable.clear();
		    				}
		    				else{
			    				if ((td.getGroupsSize()*numOfGraphRRSWN) > wnvAvailable.size()){
			    					int missingPlayers = (td.getGroupsSize()*numOfGraphRRSWN) - wnvAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
			    							wnvAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(wnvAvailable);
			    						for (int c=0;c<(wnvAvailable.size()+missingPlayers);c++){
			    							if (c<wnvAvailable.size()){
			    								wnvAvailableFinal.add(wnvAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								wnvAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						wnvAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (wnvAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", wnvAvailable.size()/numOfGraphRRSWN);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", wnvAvailableFinal.size()/numOfGraphRRSWN);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("DM") && category != null && !category.equals("0")){
	    	mdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("DM") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDM =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					mdAvailableFinal.add(match.getPlayer1());
			    					mdAvailableFinal.add(match.getPlayer1d());
			    					mdAvailableFinal.add(match.getPlayer2());
			    					mdAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			mdAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= mdAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-mdAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					mdAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(mdAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<mdAvailable.size()){
					    						mdAvailableFinal.add(mdAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						mdAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					mdAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				mdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
		    				numOfGraphRRDM = roundUp(mdAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						mdAvailableFinal.add(groups.get(f).getPlayer());
		    						mdAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					mdAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDM)*2) > mdAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDM)*2) - mdAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					mdAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(mdAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("mdAvailable.size:" + mdAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(mdAvailable.size()+missingPlayers);c++){
			    							if (c<mdAvailable.size()){
			    								mdAvailableFinal.add(mdAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								mdAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(mdAvailableFinal);
			    						mdAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (mdAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", (mdAvailable.size()/2)/numOfGraphRRDM);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", (mdAvailableFinal.size()/2)/numOfGraphRRDM);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("DW") && category != null && !category.equals("0")){
	    	wdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("DW") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDW =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					wdAvailableFinal.add(match.getPlayer1());
			    					wdAvailableFinal.add(match.getPlayer1d());
			    					wdAvailableFinal.add(match.getPlayer2());
			    					wdAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			wdAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= wdAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-wdAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					wdAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(wdAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<wdAvailable.size()){
					    						wdAvailableFinal.add(wdAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						wdAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					wdAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				wdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
		    				numOfGraphRRDW = roundUp(wdAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						wdAvailableFinal.add(groups.get(f).getPlayer());
		    						wdAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					wdAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDW)*2) > wdAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDW)*2) - wdAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					wdAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(wdAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("wdAvailable.size:" + wdAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(wdAvailable.size()+missingPlayers);c++){
			    							if (c<wdAvailable.size()){
			    								wdAvailableFinal.add(wdAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								wdAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(wdAvailableFinal);
			    						wdAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
		    				if (numOfGraphRRDW > 0){
		    					if (wdAvailable.size()>0){
		    						model.addAttribute("gamesXgroup", (wdAvailable.size()/2)/numOfGraphRRDW);
		    					}
		    					else{
		    						model.addAttribute("gamesXgroup", (wdAvailableFinal.size()/2)/numOfGraphRRDW);
		    					}
		    				}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("DMN") && category != null && !category.equals("0")){
	    	nvmdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("DMN") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDMN =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					nvmdAvailableFinal.add(match.getPlayer1());
			    					nvmdAvailableFinal.add(match.getPlayer1d());
			    					nvmdAvailableFinal.add(match.getPlayer2());
			    					nvmdAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			nvmdAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= nvmdAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-nvmdAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					nvmdAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(nvmdAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<nvmdAvailable.size()){
					    						nvmdAvailableFinal.add(nvmdAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						nvmdAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					nvmdAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				nvmdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
		    				numOfGraphRRDMN = roundUp(nvmdAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						nvmdAvailableFinal.add(groups.get(f).getPlayer());
		    						nvmdAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					nvmdAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDMN)*2) > nvmdAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDMN)*2) - nvmdAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					nvmdAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(nvmdAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("mdAvailable.size:" + nvmdAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(nvmdAvailable.size()+missingPlayers);c++){
			    							if (c<nvmdAvailable.size()){
			    								nvmdAvailableFinal.add(nvmdAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								nvmdAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(nvmdAvailableFinal);
			    						nvmdAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
	    					if (nvmdAvailable.size()>0){
	    						model.addAttribute("gamesXgroup", (nvmdAvailable.size()/2)/numOfGraphRRDMN);
	    					}
	    					else{
	    						model.addAttribute("gamesXgroup", (nvmdAvailableFinal.size()/2)/numOfGraphRRDMN);
	    					}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("DWN") && category != null && !category.equals("0")){
	    	nvwdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("DWN") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDWN =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					nvwdAvailableFinal.add(match.getPlayer1());
			    					nvwdAvailableFinal.add(match.getPlayer1d());
			    					nvwdAvailableFinal.add(match.getPlayer2());
			    					nvwdAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			nvwdAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= nvwdAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-nvwdAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					nvwdAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(nvwdAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<nvwdAvailable.size()){
					    						nvwdAvailableFinal.add(nvwdAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						nvwdAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					nvwdAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				nvwdAvailable = this.playerService.listPlayerOnCategory(t.getId(), "D", Integer.parseInt(category));
		    				numOfGraphRRDWN = roundUp(nvwdAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						nvwdAvailableFinal.add(groups.get(f).getPlayer());
		    						nvwdAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					nvwdAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDWN)*2) > nvwdAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDWN)*2) - nvwdAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					nvwdAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(nvwdAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("wdAvailable.size:" + nvwdAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(nvwdAvailable.size()+missingPlayers);c++){
			    							if (c<nvwdAvailable.size()){
			    								nvwdAvailableFinal.add(nvwdAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								nvwdAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(nvwdAvailableFinal);
			    						nvwdAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
		    				if (numOfGraphRRDWN > 0){
		    					if (nvwdAvailable.size()>0){
		    						model.addAttribute("gamesXgroup", (nvwdAvailable.size()/2)/numOfGraphRRDWN);
		    					}
		    					else{
		    						model.addAttribute("gamesXgroup", (nvwdAvailableFinal.size()/2)/numOfGraphRRDWN);
		    					}
		    				}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("MA") && category != null && !category.equals("0")){
	    	maAvailable = this.playerService.listPlayerOnCategory(t.getId(), "M", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("MA") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDMA =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					maAvailableFinal.add(match.getPlayer1());
			    					maAvailableFinal.add(match.getPlayer1d());
			    					maAvailableFinal.add(match.getPlayer2());
			    					maAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			maAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= maAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-maAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					maAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(maAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<maAvailable.size()){
					    						maAvailableFinal.add(maAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						maAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					maAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				maAvailable = this.playerService.listPlayerOnCategory(t.getId(), "M", Integer.parseInt(category));
		    				numOfGraphRRDMA = roundUp(maAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						maAvailableFinal.add(groups.get(f).getPlayer());
		    						maAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					maAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDMA)*2) > maAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDMA)*2) - maAvailable.size();
			    					System.out.println("maAvailable.size:" + maAvailable.size() );
			    					System.out.println("numOfGraphRRDMA:" + numOfGraphRRDMA);
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					maAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(maAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("maAvailable.size:" + maAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(maAvailable.size()+missingPlayers);c++){
			    							if (c<maAvailable.size()){
			    								maAvailableFinal.add(maAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								maAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(maAvailableFinal);
			    						maAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
		    				if (numOfGraphRRDMA > 0){
		    					if (maAvailable.size()>0){
		    						model.addAttribute("gamesXgroup", (maAvailable.size()/2)/numOfGraphRRDMA);
		    					}
		    					else{
		    						model.addAttribute("gamesXgroup", (maAvailableFinal.size()/2)/numOfGraphRRDMA);
		    					}
		    				}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    if (cm != null && cm.equals("MK") && category != null && !category.equals("0")){
	    	mkAvailable = this.playerService.listPlayerOnCategory(t.getId(), "M", Integer.parseInt(category));
	    	Set<TournamentDetails> tournamentDetails = t.getTournamentDetails();
	    	Iterator<TournamentDetails> iteratorTD = tournamentDetails.iterator();
	    	HashMap<String,String> fieldsMap = new HashMap<String,String>();
	    	HashMap<String,String> timesMap = new HashMap<String,String>();
	    	HashMap<String,String> datesMap = new HashMap<String,String>();
		    while(iteratorTD.hasNext()) {
		    	TournamentDetails td = iteratorTD.next();
		    	if (td.getMode().equals("MK") ){
		    		if (itContains(td.getCategories(),Integer.parseInt(category))){
		    			if (td.getFormat().equals("MD")){
		    				numOfGraphMDDMK =td.getDrawSize()/4;
			    			List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
			    			if ((matchs.size() > 0 && isAuto == null)){
			    				for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					mkAvailableFinal.add(match.getPlayer1());
			    					mkAvailableFinal.add(match.getPlayer1d());
			    					mkAvailableFinal.add(match.getPlayer2());
			    					mkAvailableFinal.add(match.getPlayer2d());
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
				    					model.addAttribute("fieldsMaps", fieldsMap);
				    					model.addAttribute("datesMaps", datesMap);
				    					model.addAttribute("timesMaps", timesMap);
			    					}
			    				}
			    			mkAvailable.clear();
			    			}
			    			else{
				    			if (td.getDrawSize()>= mkAvailable.size()){
				    				int missingPlayers = (td.getDrawSize()*2)-mkAvailable.size();
				    				if (isAuto == null){
					    				for (int i=0;i<missingPlayers;i++){
					    					mkAvailable.add(emptyPlayer);
					    				}
				    				}
				    				else{
				    					Collections.shuffle(mkAvailable);
				    					for (int c = 0;c<(td.getDrawSize()*2);c++){
					    					if (c<mkAvailable.size()){
					    						mkAvailableFinal.add(mkAvailable.get(c));
					    					}
					    					if(c<missingPlayers){
					    						mkAvailableFinal.add(emptyPlayer);
					    					}
	
				    					}
				    					mkAvailable.clear();
				    				}
				    			}
			    			}
			    		}
		    			else if (td.getFormat().equals("RR")){
		    				mkAvailable = this.playerService.listPlayerOnCategory(t.getId(), "M", Integer.parseInt(category));
		    				numOfGraphRRDMK = roundUp(mkAvailable.size()/2, td.getGroupsSize());
		    				model.addAttribute("playersPerGroup", td.getGroupsSize());
		    				List<Match> matchs = this.matchService.listMatchByTourCat(td.getId(), Integer.parseInt(category));
		    				if (matchs.size() > 0 && isAuto == null){
		    					List<Groups> groups = this.groupsService.listGroupByTourCat(td.getId(), Integer.parseInt(category));
		    					for (int f=0;f<groups.size();f++){
		    						mkAvailableFinal.add(groups.get(f).getPlayer());
		    						mkAvailableFinal.add(groups.get(f).getPlayerD());
		    					}
		    					for(int d=0;d<matchs.size();d++){
			    					Match match = matchs.get(d);
			    					Timestamp timestamp = match.getDate();
			    					SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm aaa");
			    					if (timestamp != null){
				    					String stringDate = dateFormat.format(timestamp);
				    					datesMap.put(String.valueOf(match.getMatchNumber()),stringDate.substring(0, 10));
				    					timesMap.put(String.valueOf(match.getMatchNumber()), stringDate.substring(11));
				    					fieldsMap.put(String.valueOf(match.getMatchNumber()), match.getField());
			    					}
			    				}
		    					model.addAttribute("fieldsMaps", fieldsMap);
		    					model.addAttribute("datesMaps", datesMap);
		    					model.addAttribute("timesMaps", timesMap);
		    					
		    					mkAvailable.clear();
		    				}
		    				else{
			    				if (((td.getGroupsSize()*numOfGraphRRDMK)*2) > mkAvailable.size()){
			    					int missingPlayers = ((td.getGroupsSize()*numOfGraphRRDMK)*2) - mkAvailable.size();
			    					if (isAuto == null){
			    						for (int i=0;i<missingPlayers;i++){
					    					mkAvailable.add(emptyPlayer);
					    				}
			    					}
			    					else{
			    						Collections.shuffle(mkAvailable);
			    						System.out.println("Si entro al else de que fue Auto not null");
			    						System.out.println("mkAvailable.size:" + mkAvailable.size() );
			    						System.out.println("missingPlayers:" + missingPlayers);
			    						for (int c=0;c<(mkAvailable.size()+missingPlayers);c++){
			    							if (c<mkAvailable.size()){
			    								mkAvailableFinal.add(mkAvailable.get(c));
			    							}
			    							if (c<missingPlayers){
			    								mkAvailableFinal.add(emptyPlayer);
			    							}
			    						}
			    						Collections.shuffle(mkAvailableFinal);
			    						mkAvailable = new ArrayList<Player>();
			    					}
			    					
			    				}
		    				}
		    				
		    				if (numOfGraphRRDMK > 0){
		    					if (mkAvailable.size()>0){
		    						model.addAttribute("gamesXgroup", (mkAvailable.size()/2)/numOfGraphRRDMK);
		    					}
		    					else{
		    						model.addAttribute("gamesXgroup", (mkAvailableFinal.size()/2)/numOfGraphRRDMK);
		    					}
		    				}
		    			}
		    		}
		    		
		    	}
		    }

	    }
	    
	    model.addAttribute("mAvailable", mAvailable);
	    model.addAttribute("mAvailableFinal", mAvailableFinal);
	    model.addAttribute("wAvailable", wAvailable);
	    model.addAttribute("wAvailableFinal", wAvailableFinal);
	    model.addAttribute("mnvAvailable", mnvAvailable);
	    model.addAttribute("mnvAvailableFinal", mnvAvailableFinal);
	    model.addAttribute("wnvAvailable", wnvAvailable);
	    model.addAttribute("wnvAvailableFinal", wnvAvailableFinal);
	    model.addAttribute("numOfGraphMD", numOfGraphMD);
	    model.addAttribute("numOfGraphRR", numOfGraphRR);
	    model.addAttribute("numOfGraphMDSMN", numOfGraphMDSMN);
	    model.addAttribute("numOfGraphRRSMN", numOfGraphRRSMN);
	    model.addAttribute("numOfGraphMDSWN", numOfGraphMDSWN);
	    model.addAttribute("numOfGraphRRSWN", numOfGraphRRSWN);
	    model.addAttribute("numOfGraphMDSW", numOfGraphMDSW);
	    model.addAttribute("numOfGraphRRSW", numOfGraphRRSW);
	    model.addAttribute("mdAvailable", mdAvailable);
	    model.addAttribute("mdAvailableFinal", mdAvailableFinal);
	    model.addAttribute("numOfGraphMDDM", numOfGraphMDDM);
	    model.addAttribute("numOfGraphRRDM", numOfGraphRRDM);
	    model.addAttribute("wdAvailable", wdAvailable);
	    model.addAttribute("wdAvailableFinal", wdAvailableFinal);
	    model.addAttribute("numOfGraphMDDW", numOfGraphMDDW);
	    model.addAttribute("numOfGraphRRDW", numOfGraphRRDW);
	    model.addAttribute("nvmdAvailable", nvmdAvailable);
	    model.addAttribute("nvmdAvailableFinal", nvmdAvailableFinal);
	    model.addAttribute("numOfGraphMDDMN", numOfGraphMDDMN);
	    model.addAttribute("numOfGraphRRDMN", numOfGraphRRDMN);
	    model.addAttribute("nvwdAvailable", nvwdAvailable);
	    model.addAttribute("nvwdAvailableFinal", nvwdAvailableFinal);
	    model.addAttribute("numOfGraphMDDWN", numOfGraphMDDWN);
	    model.addAttribute("numOfGraphRRDWN", numOfGraphRRDWN);
	    model.addAttribute("maAvailable", maAvailable);
	    model.addAttribute("maAvailableFinal", maAvailableFinal);
	    model.addAttribute("numOfGraphMDMA", numOfGraphMDDMA);
	    model.addAttribute("numOfGraphRRMA", numOfGraphRRDMA);
	    model.addAttribute("mkAvailable", mkAvailable);
	    model.addAttribute("mkAvailableFinal", mkAvailableFinal);
	    model.addAttribute("numOfGraphMDMK", numOfGraphMDDMK);
	    model.addAttribute("numOfGraphRRMK", numOfGraphRRDMK);
	    
	    
		
		return "draws";
		
	}
	
	private boolean itContains (Set<Category> categories, int id){
			for (Category c: categories){
				if (c.getId() == id){
					return true;
				}
			}
		return false;
	}
	
	public  int roundUp(int dividend, int divisor) {
        return (dividend + divisor - 1) / divisor;
    }
	
	private void generaRR(List<Player> mAvailable){
		for (int a =0; a<mAvailable.size();a++){
			for(int b=0; b<mAvailable.size();b++){
				if (b>a){
					System.out.println("Juegan:"+ (a+1)   + " vs " + (b+1));
				}
			}
		}
		
	}
	
	private void createOneRound(int N) {
		int totalMatches = N*(N-1)/2;
		int MAX_MATCHES_IN_DAY = N/2;
		int days = 0;
		int[] a;
		
		
		if (N % 2 == 0){
			a = new int[N-1];
			MAX_MATCHES_IN_DAY = N/2;
			for(int i=0;i<N-1;i++)
				a[i] = i+1;
			
		}
		else{
			a = new int[N];
			MAX_MATCHES_IN_DAY = (N+1)/2;
			for(int i=0;i<N;i++)
				a[i] = i+1;
			
		}
		
		
		
		while(totalMatches!=0){
			int j=0;
			int num = MAX_MATCHES_IN_DAY;
			System.out.print("\n Day " + (days+1) + " Matches :");
			int p =1;
			while(num!=0){
				// Check if team j has played all the matches
				
				if (totalMatches!=0){
					if(a[j]<N){
						int matchnumber = N*(N-1)/2 - totalMatches +1;
						if (j==0){
							System.out.print("Match " + matchnumber +": " + "Team " + (j+1) + " Vs Team " + (a[j]+1) + " ");
						}
						else{
							if (days==0){
								System.out.print("Match " + matchnumber +": " + "Team " + (j+2) + " Vs Team " + (a[j]+2) + " ");
								j++;
							}
							else{
								System.out.print("Match " + matchnumber +": " + "Team " + (j+p) + " Vs Team " + (a[j]+(p+1)) + " ");
								p++;
								j--;
							}
								
							
						}
						a[j++] += 1;
						totalMatches--;
						num--;
					}else
						j++;
				}
				else{
					num = 0;
				}
			}
			days++;
			}
		
			System.out.println("\n Total Number of Days is " + days);	
		
    }
	
	
	
		
}
