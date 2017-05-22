package com.bj.greenball.controller;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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

import com.bj.greenball.model.Category;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;
import com.bj.greenball.service.CategoryService;
import com.bj.greenball.service.PlayerService;
import com.bj.greenball.service.TournamentService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
 
	
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

	
	@RequestMapping(value = "/{shortName}/categories", method = RequestMethod.GET)
	public ModelAndView listTournaments(@PathVariable String shortName) {
		List<String> mensActive = new ArrayList<String>();
		List<String> mensNoActive = new ArrayList<String>();
		List<String> womansActive = new ArrayList<String>();
		List<String> womansNoActive = new ArrayList<String>();
		List<String> mixtosActive = new ArrayList<String>();
		List<String> mixtosNoActive = new ArrayList<String>();
		List<String> nvmensActive = new ArrayList<String>();
		List<String> nvmensNoActive = new ArrayList<String>();
		List<String> nvwomansActive = new ArrayList<String>();
		List<String> nvwomansNoActive = new ArrayList<String>();
		List<String> nvmixActive = new ArrayList<String>();
		List<String> nvmixNoActive = new ArrayList<String>();
		List<String> mensActiveDoubles = new ArrayList<String>();
		List<String> mensNoActiveDoubles = new ArrayList<String>();
		List<String> womansActiveDoubles = new ArrayList<String>();
		List<String> womansNoActiveDoubles = new ArrayList<String>();
		List<String> nvmensActiveDoubles = new ArrayList<String>();
		List<String> nvmensNoActiveDoubles = new ArrayList<String>();
		List<String> nvwomansActiveDoubles = new ArrayList<String>();
		List<String> nvwomansNoActiveDoubles = new ArrayList<String>();
		
		
		ModelAndView model = new ModelAndView("categories");
		model.addObject("category", new Category());
		//model.addObject("listCategories", this.categoryService.listCategory(1));
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Tournament t = this.tournamentService.getTournamentByShortName(shortName);
		Iterator<Category> iterator = t.getCategories().iterator();
	    while(iterator.hasNext()) {
	    	Category cat = iterator.next();
	    	if (cat.getSex().equals("M")){
	    		mensActive.add(cat.getName());
	    	}
	    }
	    if (!mensActive.contains("A")){mensNoActive.add("A");}
	    if (!mensActive.contains("B")){mensNoActive.add("B");}
	    if (!mensActive.contains("C")){mensNoActive.add("C");}
	    if (!mensActive.contains("D")){mensNoActive.add("D");}
	    
	    // llena tab de mujeres
	    Iterator<Category> iteratorW = t.getCategories().iterator();
	    while(iteratorW.hasNext()) {
	    	Category cat = iteratorW.next();
	    	if (cat.getSex().equals("W")){
	    		womansActive.add(cat.getName());
	    	}
	    }
	    if (!womansActive.contains("A")){womansNoActive.add("A");}
	    if (!womansActive.contains("B")){womansNoActive.add("B");}
	    if (!womansActive.contains("C")){womansNoActive.add("C");}
	    if (!womansActive.contains("D")){womansNoActive.add("D");}
	    
	    //llena tab de mixtos
	    Iterator<Category> iteratorMIX = t.getCategories().iterator();
	    while(iteratorMIX.hasNext()) {
	    	Category cat = iteratorMIX.next();
	    	if (cat.getSex().equals("MIX")){
	    		mixtosActive.add(cat.getName());
	    	}
	    }
	    if (!mixtosActive.contains("A")){mixtosNoActive.add("A");}
	    if (!mixtosActive.contains("B")){mixtosNoActive.add("B");}
	    if (!mixtosActive.contains("C")){mixtosNoActive.add("C");}
	    if (!mixtosActive.contains("D")){mixtosNoActive.add("D");}
	    
	  //llena tab de NVM
	    Iterator<Category> iteratorNVMens = t.getCategories().iterator();
	    while(iteratorNVMens.hasNext()) {
	    	Category cat = iteratorNVMens.next();
	    	if (cat.getSex().equals("NVM")){
	    		nvmensActive.add(cat.getName());
	    	}
	    }
	    if (!nvmensActive.contains("A")){nvmensNoActive.add("A");}
	    if (!nvmensActive.contains("B")){nvmensNoActive.add("B");}
	    if (!nvmensActive.contains("C")){nvmensNoActive.add("C");}
	    if (!nvmensActive.contains("D")){nvmensNoActive.add("D");}
	    
	  //llena tab de NVW
	    Iterator<Category> iteratorNVWomans = t.getCategories().iterator();
	    while(iteratorNVWomans.hasNext()) {
	    	Category cat = iteratorNVWomans.next();
	    	if (cat.getSex().equals("NVW")){
	    		nvwomansActive.add(cat.getName());
	    	}
	    }
	    if (!nvwomansActive.contains("A")){nvwomansNoActive.add("A");}
	    if (!nvwomansActive.contains("B")){nvwomansNoActive.add("B");}
	    if (!nvwomansActive.contains("C")){nvwomansNoActive.add("C");}
	    if (!nvwomansActive.contains("D")){nvwomansNoActive.add("D");}
	    
	    //llena tab de NVMIX
	    Iterator<Category> iteratorNVMix = t.getCategories().iterator();
	    while(iteratorNVMix.hasNext()) {
	    	Category cat = iteratorNVMix.next();
	    	if (cat.getSex().equals("NVMIX")){
	    		nvmixActive.add(cat.getName());
	    	}
	    }
	    if (!nvmixActive.contains("A")){nvmixNoActive.add("A");}
	    if (!nvmixActive.contains("B")){nvmixNoActive.add("B");}
	    if (!nvmixActive.contains("C")){nvmixNoActive.add("C");}
	    if (!nvmixActive.contains("D")){nvmixNoActive.add("D");}
	    
	    Iterator<Category> iteratorD = t.getCategories().iterator();
	    while(iteratorD.hasNext()) {
	    	Category cat = iteratorD.next();
	    	if (cat.getSex().equals("MD")){
	    		mensActiveDoubles.add(cat.getName());
	    	}
	    }
	    if (!mensActiveDoubles.contains("A")){mensNoActiveDoubles.add("A");}
	    if (!mensActiveDoubles.contains("B")){mensNoActiveDoubles.add("B");}
	    if (!mensActiveDoubles.contains("C")){mensNoActiveDoubles.add("C");}
	    if (!mensActiveDoubles.contains("D")){mensNoActiveDoubles.add("D");}
	    
	    // llena tab de mujeres
	    Iterator<Category> iteratorWD = t.getCategories().iterator();
	    while(iteratorWD.hasNext()) {
	    	Category cat = iteratorWD.next();
	    	if (cat.getSex().equals("WD")){
	    		womansActiveDoubles.add(cat.getName());
	    	}
	    }
	    if (!womansActiveDoubles.contains("A")){womansNoActiveDoubles.add("A");}
	    if (!womansActiveDoubles.contains("B")){womansNoActiveDoubles.add("B");}
	    if (!womansActiveDoubles.contains("C")){womansNoActiveDoubles.add("C");}
	    if (!womansActiveDoubles.contains("D")){womansNoActiveDoubles.add("D");}
	    
	  //llena tab de NVM
	    Iterator<Category> iteratorNVMensD = t.getCategories().iterator();
	    while(iteratorNVMensD.hasNext()) {
	    	Category cat = iteratorNVMensD.next();
	    	if (cat.getSex().equals("NVMD")){
	    		nvmensActiveDoubles.add(cat.getName());
	    	}
	    }
	    if (!nvmensActiveDoubles.contains("A")){nvmensNoActiveDoubles.add("A");}
	    if (!nvmensActiveDoubles.contains("B")){nvmensNoActiveDoubles.add("B");}
	    if (!nvmensActiveDoubles.contains("C")){nvmensNoActiveDoubles.add("C");}
	    if (!nvmensActiveDoubles.contains("D")){nvmensNoActiveDoubles.add("D");}
	    
	  //llena tab de NVW
	    Iterator<Category> iteratorNVWomansD = t.getCategories().iterator();
	    while(iteratorNVWomansD.hasNext()) {
	    	Category cat = iteratorNVWomansD.next();
	    	if (cat.getSex().equals("NVWD")){
	    		nvwomansActiveDoubles.add(cat.getName());
	    	}
	    }
	    if (!nvwomansActiveDoubles.contains("A")){nvwomansNoActiveDoubles.add("A");}
	    if (!nvwomansActiveDoubles.contains("B")){nvwomansNoActiveDoubles.add("B");}
	    if (!nvwomansActiveDoubles.contains("C")){nvwomansNoActiveDoubles.add("C");}
	    if (!nvwomansActiveDoubles.contains("D")){nvwomansNoActiveDoubles.add("D");}
	    
	    
	    model.addObject("mensActive", mensActive);
	    model.addObject("mensNoActive", mensNoActive);
	    model.addObject("womansActive", womansActive);
	    model.addObject("womansNoActive", womansNoActive);
	    model.addObject("mixtosActive", mixtosActive);
	    model.addObject("mixtosNoActive", mixtosNoActive);
	    model.addObject("nvmensActive", nvmensActive);
	    model.addObject("nvmensNoActive", nvmensNoActive);
	    model.addObject("nvwomansActive", nvwomansActive);
	    model.addObject("nvwomansNoActive", nvwomansNoActive);
	    model.addObject("nvmixActive", nvmixActive);
	    model.addObject("nvmixNoActive", nvmixNoActive);
	    model.addObject("mensActiveDoubles", mensActiveDoubles);
	    model.addObject("mensNoActiveDoubles", mensNoActiveDoubles);
	    model.addObject("womansActiveDoubles", womansActiveDoubles);
	    model.addObject("womansNoActiveDoubles", womansNoActiveDoubles);
	    model.addObject("nvmensActiveDoubles", nvmensActiveDoubles);
	    model.addObject("nvmensNoActiveDoubles", nvmensNoActiveDoubles);
	    model.addObject("nvwomansActiveDoubles", nvwomansActiveDoubles);
	    model.addObject("nvwomansNoActiveDoubles", nvwomansNoActiveDoubles);
	    model.addObject("shortName", shortName);
		
		return model;
	}
	


	@RequestMapping(value= "/{shortName}/addCategory", method = RequestMethod.POST)
	public   ModelAndView addPerson(@Valid @ModelAttribute("category")  Category c,  HttpServletRequest request, @PathVariable String shortName){
		
		ModelAndView model = new ModelAndView("categories");
		
		String[] liMensCategory = request.getParameterValues("mensCategory");
		String[] liWomansCategory = request.getParameterValues("womansCategory");
		String[] liMixtosCategory = request.getParameterValues("mixtosCategory");
		String[] liNVMensCategory = request.getParameterValues("nvMensCategory");
		String[] liNVWomansCategory = request.getParameterValues("nvWomansCategory");
		String[] liNVMixtosCategory = request.getParameterValues("nvMixtosCategory");
		String[] liMensCategoryDoubles = request.getParameterValues("mensCategoryDoubles");
		String[] liWomansCategoryDoubles = request.getParameterValues("womansCategoryDoubles");
		String[] liNVMensCategoryDoubles = request.getParameterValues("nvMensCategoryDoubles");
		String[] liNVWomansCategoryDoubles = request.getParameterValues("nvWomansCategoryDoubles");

		System.out.println("Valor de shortName: " + shortName);
		Tournament t1 = this.tournamentService.getTournamentByShortName(shortName);
		System.out.println("SIrecurpero el torneo por nombre: "+ t1.getName());
		Tournament t = this.tournamentService.getTournamentByShortName(shortName);
		if (liMensCategory != null && liMensCategory.length > 0){
			for (int i =0;i<liMensCategory.length;i++){
				Category mens = new Category();
				mens.setSex("M");
				mens.setName(liMensCategory[i]);
				//mens.setId(0);
				if (!existCategoryInTournament(t,liMensCategory[i],"M")){
					t.getCategories().add(mens);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMensCategory)){
		        	if (pT.getSex().equals("M")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMensCategory)){
				    if (pT.getSex().equals("M")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		
		if (liWomansCategory != null && liWomansCategory.length > 0){
			for (int i =0;i<liWomansCategory.length;i++){
				Category womans = new Category();
				womans.setSex("W");
				womans.setName(liWomansCategory[i]);
				if (!existCategoryInTournament(t,liWomansCategory[i],"W")){
					t.getCategories().add(womans);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liWomansCategory)){
		        	if (pT.getSex().equals("W")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liWomansCategory)){
				    if (pT.getSex().equals("W")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		
		
		if (liMixtosCategory != null && liMixtosCategory.length > 0){
			for (int i =0;i<liMixtosCategory.length;i++){
				Category womans = new Category();
				womans.setSex("MIX");
				womans.setName(liMixtosCategory[i]);
				if (!existCategoryInTournament(t,liMixtosCategory[i],"MIX")){
					t.getCategories().add(womans);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMixtosCategory)){
		        	if (pT.getSex().equals("MIX")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMixtosCategory)){
				    if (pT.getSex().equals("MIX")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}

		if (liNVMensCategory != null && liNVMensCategory.length > 0){
			for (int i =0;i<liNVMensCategory.length;i++){
				Category nvmess = new Category();
				nvmess.setSex("NVM");
				nvmess.setName(liNVMensCategory[i]);
				if (!existCategoryInTournament(t,liNVMensCategory[i],"NVM")){
					t.getCategories().add(nvmess);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMensCategory)){
		        	if (pT.getSex().equals("NVM")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMensCategory)){
				    if (pT.getSex().equals("NVM")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		

		if (liNVWomansCategory != null && liNVWomansCategory.length > 0){
			for (int i =0;i<liNVMensCategory.length;i++){
				Category nvw = new Category();
				nvw.setSex("NVW");
				nvw.setName(liNVWomansCategory[i]);
				if (!existCategoryInTournament(t,liNVWomansCategory[i],"NVW")){
					t.getCategories().add(nvw);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVWomansCategory)){
		        	if (pT.getSex().equals("NVW")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVWomansCategory)){
				    if (pT.getSex().equals("NVW")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}

		
		if (liNVMixtosCategory != null && liNVMixtosCategory.length > 0){
			for (int i =0;i<liNVMensCategory.length;i++){
				Category nvm = new Category();
				nvm.setSex("NVMIX");
				nvm.setName(liNVMixtosCategory[i]);
				if (!existCategoryInTournament(t,liNVMixtosCategory[i],"NVMIX")){
					t.getCategories().add(nvm);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMixtosCategory)){
		        	if (pT.getSex().equals("NVMIX")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMixtosCategory)){
				    if (pT.getSex().equals("NVMIX")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		if (liMensCategoryDoubles != null && liMensCategoryDoubles.length > 0){
			for (int i =0;i<liMensCategoryDoubles.length;i++){
				Category mensDoubles = new Category();
				mensDoubles.setSex("MD");
				mensDoubles.setName(liMensCategoryDoubles[i]);
				//mens.setId(0);
				if (!existCategoryInTournament(t,liMensCategoryDoubles[i],"MD")){
					t.getCategories().add(mensDoubles);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMensCategoryDoubles)){
		        	if (pT.getSex().equals("MD")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liMensCategoryDoubles)){
				    if (pT.getSex().equals("MD")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		if (liWomansCategoryDoubles != null && liWomansCategoryDoubles.length > 0){
			for (int i =0;i<liWomansCategoryDoubles.length;i++){
				Category womansDoubles = new Category();
				womansDoubles.setSex("WD");
				womansDoubles.setName(liWomansCategoryDoubles[i]);
				if (!existCategoryInTournament(t,liWomansCategoryDoubles[i],"WD")){
					t.getCategories().add(womansDoubles);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liWomansCategoryDoubles)){
		        	if (pT.getSex().equals("WD")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liWomansCategoryDoubles)){
				    if (pT.getSex().equals("WD")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		if (liNVMensCategoryDoubles != null && liNVMensCategoryDoubles.length > 0){
			for (int i =0;i<liNVMensCategoryDoubles.length;i++){
				Category nvmessDoubles = new Category();
				nvmessDoubles.setSex("NVMD");
				nvmessDoubles.setName(liNVMensCategoryDoubles[i]);
				if (!existCategoryInTournament(t,liNVMensCategoryDoubles[i],"NVMD")){
					t.getCategories().add(nvmessDoubles);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMensCategoryDoubles)){
		        	if (pT.getSex().equals("NVMD")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVMensCategoryDoubles)){
				    if (pT.getSex().equals("NVMD")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		if (liNVWomansCategoryDoubles != null && liNVWomansCategoryDoubles.length > 0){
			for (int i =0;i<liNVMensCategoryDoubles.length;i++){
				Category nvwDoubles = new Category();
				nvwDoubles.setSex("NVWD");
				nvwDoubles.setName(liNVWomansCategoryDoubles[i]);
				if (!existCategoryInTournament(t,liNVWomansCategoryDoubles[i],"NVWD")){
					t.getCategories().add(nvwDoubles);
				}
			}
			this.tournamentService.updateTournament(t);
			t = this.tournamentService.getTournamentByShortName(shortName);
			Iterator<Category> iterator = t.getCategories().iterator();
			boolean quita = false;
			List<Category> cate = new ArrayList<Category>();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVWomansCategoryDoubles)){
		        	if (pT.getSex().equals("NVWD")){ 
		        		cate.add(pT);
						iterator.remove();
						quita = true;
		        	}
				}
		     }
		    if (quita){
		    	for (int i=0;i<cate.size();i++){
		    		this.tournamentService.updateTournament(t);
					this.categoryService.removeCategory(cate.get(i).getId());
					t = this.tournamentService.getTournamentByShortName(shortName);
		    	}
		    	
		    }
		}
		else{
			Iterator<Category> iterator = t.getCategories().iterator();
		    while(iterator.hasNext()) {
		        Category pT = iterator.next();
		        if (wasRemoved(pT,liNVWomansCategoryDoubles)){
				    if (pT.getSex().equals("NVWD")){    	
						iterator.remove();
						this.tournamentService.updateTournament(t);
						this.categoryService.removeCategory(pT.getId());
						t = this.tournamentService.getTournamentByShortName(shortName);
				    }
				}
		     }
		}
		
		model.setViewName("redirect:/"+shortName+"/categories");
		return model;
		
	}
	
	

	
	private boolean existCategoryInTournament(Tournament t, String cat, String sex){
		Iterator<Category> iterator = t.getCategories().iterator();
	    while(iterator.hasNext()) {
	        Category pT = iterator.next();
	        if (pT.getSex().equals(sex) && pT.getName().equals(cat)){
	        	return true;
	        }
	    }
		
		return false;
	}
	
	private boolean wasRemoved(Category pT, String[] nuevasCategorias){
		if (nuevasCategorias == null){
			return true;
		}

	        for (int i=0;i<nuevasCategorias.length;i++){
	        	if (pT.getName().equals(nuevasCategorias[i])){
	        		return false;
	        	}
	        }
		
		return true;
	}
	
	
	
	
}
