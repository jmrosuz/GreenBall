package com.bj.greenball.controller;


import java.util.Iterator;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;
import com.bj.greenball.service.PlayerService;
import com.bj.greenball.service.TournamentService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class TournamentController {
	
	private static final Logger logger = LoggerFactory.getLogger(TournamentController.class);
 
	
	private PlayerService playerService;
	private TournamentService tournamentService;

	
	
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
	
	@RequestMapping(value = "/tournaments", method = RequestMethod.GET)
	public ModelAndView listTournaments() {
		
		ModelAndView model = new ModelAndView("tournaments");
		model.addObject("tournament", new Tournament());
		model.addObject("listTournaments", this.tournamentService.listTournament());
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		return model;
	}
	
	
	
	@RequestMapping(value="/addTournament",params="cancelar",method=RequestMethod.POST)
    public ModelAndView cancelar()
    {
		ModelAndView model = new ModelAndView("tournaments");
		model.addObject("tournament", new Tournament());
		model.addObject("listTournaments", this.tournamentService.listTournament());
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.setViewName("redirect:/tournaments");
		
		return model;
    }

	@RequestMapping(value= "/addTournament", method = RequestMethod.POST)
	public   ModelAndView addPerson(@Valid @ModelAttribute("tournament")  Tournament t,  BindingResult result){
		
		ModelAndView model = new ModelAndView("tournaments");
		if (result.hasErrors())
		{
			model.setViewName("tournaments");
			model.addObject("tournament", t);
			model.addObject("listTournaments", this.tournamentService.listTournament());
			model.addObject("hasError", " has-error");
			
			return model;
			
		}
		else{
			if (t.getId()==0){ 
				System.out.println("añado nuevo");
				this.tournamentService.addTournament(t);
				model.addObject("tournament", new Tournament());
				model.addObject("listTournaments", this.tournamentService.listTournament());
			}
			else{
				System.out.println("hago update a torneo");
				this.tournamentService.updateTournament(t);
				model.addObject("tournament", new Tournament());
				model.addObject("listTournaments", this.tournamentService.listTournament());
				
				model.setViewName("redirect:/tournaments");
			}
			
		}
		
		
		
		return model;
		
	}
	
	@RequestMapping(value= "/editTournament/{id}", method = RequestMethod.GET)
	public String  editPlayer(@PathVariable int id,  Model m){
		m.addAttribute("tournament", this.tournamentService.getTournamentById(id));
		m.addAttribute("listTournaments", this.tournamentService.listTournament());
		return "tournaments";
		
	}
	
	@RequestMapping(value= "/removeTournament/{id}", method = RequestMethod.GET)
	public   ModelAndView removePlayer(Model modelm, @PathVariable int id){
		Tournament t = null;
		ModelAndView model = new ModelAndView("tournament");
		
		
			t = this.tournamentService.getTournamentById(id);
			
			Iterator<Player> iterator = t.getPlayers().iterator();
			Iterator<Player> iterator2 = t.getPlayers().iterator();
		    while(iterator.hasNext()) {
		        Player pT = iterator.next();
		            iterator.remove();
		    }
			
			
			this.tournamentService.removeTournament(id);
			
			while(iterator2.hasNext()) {
		        Player pT2 = iterator2.next();
		        this.playerService.removePlayer(pT2.getIdPlayer());    
		    }
			
			
			model.addObject("tournament", new Tournament());
			model.addObject("listTournaments", this.tournamentService.listTournament());
		
		
		model.setViewName("redirect:/tournaments");
		
		return model;
		
	}
	
	
}
