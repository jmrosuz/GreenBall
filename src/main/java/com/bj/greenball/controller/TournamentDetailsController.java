package com.bj.greenball.controller;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bj.greenball.model.Category;
import com.bj.greenball.model.Player;
import com.bj.greenball.model.Tournament;
import com.bj.greenball.model.TournamentDetails;
import com.bj.greenball.service.CategoryService;
import com.bj.greenball.service.PlayerService;
import com.bj.greenball.service.TournamentDetailsService;
import com.bj.greenball.service.TournamentService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class TournamentDetailsController {
	
	private static final Logger logger = LoggerFactory.getLogger(TournamentDetailsController.class);
 
	
	private TournamentService tournamentService;
	private TournamentDetailsService tournamentDetailsService;
	private CategoryService categoryService;
	private String mode ="SM";
	private String superMode = "S";

	
	
	@Autowired(required=true)
	@Qualifier(value="tournamentDetailsService")
	public void setTournamentDetailsService(TournamentDetailsService ps){
		this.tournamentDetailsService = ps;
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
	
	private Set<Category> categoryCache = new HashSet<Category>();
	private Set<Category> categoryCacheW = new HashSet<Category>();
	private Set<Category> categoryCacheDM = new HashSet<Category>();
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		binder.registerCustomEditor(Set.class, "categories", new CustomCollectionEditor(Set.class) {
			protected Object convertElement(Object element) {
				if (element instanceof Category) {
					return element;
				}
				if (element instanceof String) {
					//System.out.println("Looking up staff for id " + element + ": " + element);
					Category cat = new Category();
					cat = categoryService.getCategoryById(Integer.valueOf(element.toString()));
					if (!categoryCache.contains(cat)){
						categoryCache.add(cat);
					}
					
					return categoryCache;
				}
				//System.out.println("Don't know what to do with: " + element);
				return null;
			}
		});
		
		binder.registerCustomEditor(Set.class, "categoriesW", new CustomCollectionEditor(Set.class) {
			protected Object convertElement(Object element) {
				if (element instanceof Category) {
					return element;
				}
				if (element instanceof String) {
					//System.out.println("Looking up staff for id " + element + ": " + element);
					Category cat = new Category();
					cat = categoryService.getCategoryById(Integer.valueOf(element.toString()));
					if (!categoryCacheW.contains(cat)){
						categoryCacheW.add(cat);
					}
					
					return categoryCacheW;
				}
				//System.out.println("Don't know what to do with: " + element);
				return null;
			}
		});
		
	
	}
	
	
	

	
	@RequestMapping(value = "/tournamentDetails", method = RequestMethod.GET)
	public ModelAndView listTournaments() {
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
		
		TournamentDetails td = new TournamentDetails();
		TournamentDetails tdw = new TournamentDetails();
		TournamentDetails tddm = new TournamentDetails();
		TournamentDetails tddw = new TournamentDetails();
		TournamentDetails tdma = new TournamentDetails();
		TournamentDetails tdmn = new TournamentDetails();
		TournamentDetails tdwn = new TournamentDetails();
		TournamentDetails tdmnd = new TournamentDetails();
		TournamentDetails tdwnd = new TournamentDetails();
		TournamentDetails tdmk = new TournamentDetails();
		td.setFormat("RR");
		tdw.setFormat("RR");
		tddm.setFormat("RR");
		tdma.setFormat("RR");
		tdmn.setFormat("RR");
		tdwn.setFormat("RR");
		tdmnd.setFormat("RR");
		tdmk.setFormat("RR");
		tdwnd.setFormat("RR");
		ModelAndView model = new ModelAndView("tournamentDetails");
		model.addObject("tournamentDetails", td);
		model.addObject("tournamentDetailsWomans", tdw);
		model.addObject("tournamentDetailsDoublesM", tddm);
		model.addObject("tournamentDetailsDoublesW", tddw);
		model.addObject("tournamentDetailsMixesA", tdma);
		model.addObject("tournamentDetailsNMens", tdmn);
		model.addObject("tournamentDetailsNWomans", tdwn);
		model.addObject("tournamentDetailsNMensD", tdmnd);
		model.addObject("tournamentDetailsNWomansD", tdwnd);
		model.addObject("tournamentDetailsMixesK", tdmk);
		model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());	
		
		
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
	    
	    List<TournamentDetails> tournamentDetailsSM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMA = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMK = new ArrayList<TournamentDetails>();
	    Set<TournamentDetails> tdetails = t.getTournamentDetails();
	    Iterator<TournamentDetails> iteratorDetails = tdetails.iterator();
	    while(iteratorDetails.hasNext()) {
	    	TournamentDetails tdTemp = iteratorDetails.next();
	    	if (tdTemp.getMode().equals("SM")){
	    		tournamentDetailsSM.add(tdTemp);
	    		model.addObject("currentMode", "SM");
	    		model.addObject("currentSuperMode", "S");
	    	}
	    	else if (tdTemp.getMode().equals("SW")){
	    		tournamentDetailsSW.add(tdTemp);
	    		model.addObject("currentMode", "SW");
	    		model.addObject("currentSuperMode", "S");
	    	}
	    	else if (tdTemp.getMode().equals("DM")){
	    		tournamentDetailsDM.add(tdTemp);
	    		model.addObject("currentMode", "DM");
	    		model.addObject("currentSuperMode", "D");
	    	}
	    	else if (tdTemp.getMode().equals("DW")){
	    		tournamentDetailsDW.add(tdTemp);
	    		model.addObject("currentMode", "DW");
	    		model.addObject("currentSuperMode", "D");
	    	}
	    	else if (tdTemp.getMode().equals("MA")){
	    		tournamentDetailsMA.add(tdTemp);
	    		model.addObject("currentMode", "MA");
	    		model.addObject("currentSuperMode", "M");
	    	}
	    	else if (tdTemp.getMode().equals("SMN")){
	    		tournamentDetailsSMN.add(tdTemp);
	    		model.addObject("currentMode", "SMN");
	    		model.addObject("currentSuperMode", "S");
	    	}
	    	else if (tdTemp.getMode().equals("SWN")){
	    		tournamentDetailsSWN.add(tdTemp);
	    		model.addObject("currentMode", "SWN");
	    		model.addObject("currentSuperMode", "S");
	    	}
	    	else if (tdTemp.getMode().equals("DMN")){
	    		tournamentDetailsDMN.add(tdTemp);
	    		model.addObject("currentMode", "DMN");
	    		model.addObject("currentSuperMode", "D");
	    	}
	    	else if (tdTemp.getMode().equals("DWN")){
	    		tournamentDetailsDWN.add(tdTemp);
	    		model.addObject("currentMode", "DWN");
	    		model.addObject("currentSuperMode", "D");
	    	}
	    	else if (tdTemp.getMode().equals("MK")){
	    		tournamentDetailsMK.add(tdTemp);
	    		model.addObject("currentMode", "MK");
	    		model.addObject("currentSuperMode", "M");
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
	    
	    model.addObject("tournamentDetailsSM", tournamentDetailsSM);
	    model.addObject("tournamentDetailsSW", tournamentDetailsSW);
	    model.addObject("tournamentDetailsDM", tournamentDetailsDM);
	    model.addObject("tournamentDetailsDW", tournamentDetailsDW);
	    model.addObject("tournamentDetailsMA", tournamentDetailsMA);
	    model.addObject("tournamentDetailsSMN", tournamentDetailsSMN);
	    model.addObject("tournamentDetailsSWN", tournamentDetailsSWN);
	    model.addObject("tournamentDetailsDMN", tournamentDetailsDMN);
	    model.addObject("tournamentDetailsDWN", tournamentDetailsDWN);
	    model.addObject("tournamentDetailsMK", tournamentDetailsMK);
	    
	    model.addObject("currentMode", this.mode);
		model.addObject("currentSuperMode", this.superMode);
		this.mode ="SM";
		this.superMode = "S";
	    
	    categoryCache.clear();
	    categoryCacheW.clear();
		
		return model;
	}
	
	
	
	@RequestMapping(value="/addTournamentDetails",params="cancelar",method=RequestMethod.POST)
    public ModelAndView cancelar(@ModelAttribute("tournamentDetails")  TournamentDetails t)
    {
		ModelAndView model = new ModelAndView("tournamentDetails");
		model.addObject("tournamentDetails", new TournamentDetails());
		model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		
		model.setViewName("redirect:/tournamentDetails");
		
		return model;
    }

	@RequestMapping(value= "/addTournamentDetails", method = RequestMethod.POST)
	public   ModelAndView addPerson(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetails", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("SM");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="W", method = RequestMethod.POST)
	public   ModelAndView addWomans(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsWomans", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("SW");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="SW";
				this.superMode = "S";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="SW";
				this.superMode = "S";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="DM", method = RequestMethod.POST)
	public   ModelAndView addDoubleMens(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsDoublesM", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("DM");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="DM";
				this.superMode = "D";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="DM";
				this.superMode = "D";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="DW", method = RequestMethod.POST)
	public   ModelAndView addDoubleWomans(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsDoublesW", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("DW");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="MA";
				this.superMode = "M";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="DW";
				this.superMode = "D";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="MA", method = RequestMethod.POST)
	public   ModelAndView addMixesAdults(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsMixesA", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("MA");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="MA";
				this.superMode = "M";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="MA";
				this.superMode = "M";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="MK", method = RequestMethod.POST)
	public   ModelAndView addMixesKids(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsMixesK", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("MK");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="MK";
				this.superMode = "M";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="MK";
				this.superMode = "M";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="SWN", method = RequestMethod.POST)
	public   ModelAndView addNWomans(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsNWomans", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("SWN");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="SWN";
				this.superMode = "S";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="SMN", method = RequestMethod.POST)
	public   ModelAndView addNMens(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsNMens", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("SMN");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="SMN";
				this.superMode = "S";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="SMN";
				this.superMode = "S";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="DMN", method = RequestMethod.POST)
	public   ModelAndView addNMensD(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsNMensD", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("DMN");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="DMN";
				this.superMode = "D";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="DMN";
				this.superMode = "D";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/addTournamentDetails", params="DWN", method = RequestMethod.POST)
	public   ModelAndView addNWomansD(@Valid @ModelAttribute("tournamentDetails")  TournamentDetails t, BindingResult result){
		ModelAndView model = new ModelAndView("tournamentDetails");
		if (result.hasErrors())
		{
			model.setViewName("tournamentDetails");
			model.addObject("tournamentDetailsNWomansD", t);
			model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
			model.addObject("hasError", " has-error");
			return model;
		}
		else{
			t.setMode("DWN");
			t.setCategories(categoryCache);
			if (t.getId()==0){
				Tournament td = this.tournamentService.getTournamentByShortName("JMTOR");
				td.getTournamentDetails().add(t);
				this.tournamentService.updateTournament(td);
				this.mode ="DWN";
				this.superMode = "D";
				model.setViewName("redirect:/tournamentDetails");
			}
			else{
				TournamentDetails tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				
				Iterator<Category> categoriesBD = tourDet.getCategories().iterator();
				while(categoriesBD.hasNext()){
						categoriesBD.next();
						categoriesBD.remove();
				}
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				tourDet = this.tournamentDetailsService.getTournamentDetailsById(t.getId());
				tourDet.setCategories(t.getCategories());
				tourDet.setPoints(t.getPoints());
				tourDet.setMatchDuration(t.getMatchDuration());
				tourDet.setMode(t.getMode());
				tourDet.setAdvanceSecond(t.getAdvanceSecond());
				tourDet.setAdvanceThird(t.getAdvanceThird());
				tourDet.setDrawSize(t.getDrawSize());
				tourDet.setFieldSize(t.getFieldSize());
				tourDet.setFormat(t.getFormat());
				tourDet.setGroupsSize(t.getGroupsSize());
				tourDet.setServeMode(t.getServeMode());
				this.tournamentDetailsService.updateTournamentDetails(tourDet);
				model.setViewName("redirect:/tournamentDetails");
				this.mode ="DWN";
				this.superMode = "D";
			    }//else interno
			}//else global
		return model;
		
	}
	
	@RequestMapping(value= "/editTournamentDetails/{id}", method = RequestMethod.GET)
	public String  editPlayer(@PathVariable int id,  Model m){
		
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
	    
	    
	    m.addAttribute("mensCategoriesS", mensCategoriesS);
	    m.addAttribute("mensCategoriesD", mensCategoriesD);
	    m.addAttribute("nvmensCategoriesS", nvmensCategoriesS);
	    m.addAttribute("nvmensCategoriesD", nvmensCategoriesD);
	    m.addAttribute("womansCategoriesS", womansCategoriesS);
	    m.addAttribute("womansCategoriesD", womansCategoriesD);
	    m.addAttribute("nvwomansCategoriesS", nvwomansCategoriesS);
	    m.addAttribute("nvwomansCategoriesD", nvwomansCategoriesD);
	    m.addAttribute("mixesCategories", mixesCategories);
	    m.addAttribute("nvmixesCategories", nvmixesCategories);

	    
	    List<String> categor = new ArrayList<String>();
	    
	    
	    TournamentDetails tournamentDetails = this.tournamentDetailsService.getTournamentDetailsById(id);
	    Iterator<Category> iteratorCat = tournamentDetails.getCategories().iterator();
	    while(iteratorCat.hasNext()) {
	        Category cat = iteratorCat.next();
	        categor.add(cat.getName());
	        }
	    
	    if (tournamentDetails.getMode().equals("SM")){
	    	m.addAttribute("selectedCategoriesSM", categor);
	    	m.addAttribute("tournamentDetails", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "SM");
	    	m.addAttribute("currentSuperMode", "S");
	    }
	    else if (tournamentDetails.getMode().equals("SW")){
	    	m.addAttribute("selectedCategoriesSW", categor);
	    	m.addAttribute("tournamentDetailsWomans", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "SW");
	    	m.addAttribute("currentSuperMode", "S");
	    }
	    else if (tournamentDetails.getMode().equals("DM")){
	    	m.addAttribute("selectedCategoriesDM", categor);
	    	m.addAttribute("tournamentDetailsDoublesM", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "DM");
	    	m.addAttribute("currentSuperMode", "D");
	    }
	    
	    else if (tournamentDetails.getMode().equals("DW")){
	    	m.addAttribute("selectedCategoriesDW", categor);
	    	m.addAttribute("tournamentDetailsDoublesW", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "DW");
	    	m.addAttribute("currentSuperMode", "D");
	    }
	    else if (tournamentDetails.getMode().equals("MA")){
	    	m.addAttribute("selectedCategoriesMA", categor);
	    	m.addAttribute("tournamentDetailsMixesA", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "MA");
	    	m.addAttribute("currentSuperMode", "M");
	    }
	    else if (tournamentDetails.getMode().equals("SMN")){
	    	m.addAttribute("selectedCategoriesSMN", categor);
	    	m.addAttribute("tournamentDetailsNMens", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "SMN");
	    	m.addAttribute("currentSuperMode", "S");
	    }
	    else if (tournamentDetails.getMode().equals("SWN")){
	    	m.addAttribute("selectedCategoriesSWN", categor);
	    	m.addAttribute("tournamentDetailsNWomans", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "SWN");
	    	m.addAttribute("currentSuperMode", "S");
	    }
	    else if (tournamentDetails.getMode().equals("DMN")){
	    	m.addAttribute("selectedCategoriesDMN", categor);
	    	m.addAttribute("tournamentDetailsNMensD", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "DMN");
	    	m.addAttribute("currentSuperMode", "D");
	    }
	    else if (tournamentDetails.getMode().equals("DWN")){
	    	m.addAttribute("selectedCategoriesDWN", categor);
	    	m.addAttribute("tournamentDetailsNWomansD", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "DWN");
	    	m.addAttribute("currentSuperMode", "D");
	    }
	    else if (tournamentDetails.getMode().equals("MK")){
	    	m.addAttribute("selectedCategoriesMK", categor);
	    	m.addAttribute("tournamentDetailsMixesA", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsMixesK", this.tournamentDetailsService.getTournamentDetailsById(id));
	    	m.addAttribute("tournamentDetailsWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesM", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsDoublesW", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetails", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMens", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomans", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNMensD", new TournamentDetails("RR"));
	    	m.addAttribute("tournamentDetailsNWomansD", new TournamentDetails("RR"));
	    	m.addAttribute("currentMode", "MK");
	    	m.addAttribute("currentSuperMode", "M");
	    }
	    
	    List<TournamentDetails> tournamentDetailsSM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMA = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMK = new ArrayList<TournamentDetails>();
	    Set<TournamentDetails> tdetails = t.getTournamentDetails();
	    Iterator<TournamentDetails> iteratorDetails = tdetails.iterator();
	    while(iteratorDetails.hasNext()) {
	    	TournamentDetails tdTemp = iteratorDetails.next();
	    	if (tdTemp.getMode().equals("SM")){
	    		tournamentDetailsSM.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("SW")){
	    		tournamentDetailsSW.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("DM")){
	    		tournamentDetailsDM.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("DW")){
	    		tournamentDetailsDW.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("MA")){
	    		tournamentDetailsMA.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("SMN")){
	    		tournamentDetailsSMN.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("SWN")){
	    		tournamentDetailsSWN.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("DMN")){
	    		tournamentDetailsDMN.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("DWN")){
	    		tournamentDetailsDWN.add(tdTemp);
	    	}
	    	else if (tdTemp.getMode().equals("MK")){
	    		tournamentDetailsMK.add(tdTemp);
	    	}
	    	
	    }
		
	    m.addAttribute("tournamentDetailsSM", tournamentDetailsSM);
	    m.addAttribute("tournamentDetailsSW", tournamentDetailsSW);
	    m.addAttribute("tournamentDetailsDM", tournamentDetailsDM);
	    m.addAttribute("tournamentDetailsDW", tournamentDetailsDW);
	    m.addAttribute("tournamentDetailsMA", tournamentDetailsMA);
	    m.addAttribute("tournamentDetailsSMN", tournamentDetailsSMN);
	    m.addAttribute("tournamentDetailsSWN", tournamentDetailsSWN);
	    m.addAttribute("tournamentDetailsDMN", tournamentDetailsDMN);
	    m.addAttribute("tournamentDetailsDWN", tournamentDetailsDWN);
	    m.addAttribute("tournamentDetailsMK", tournamentDetailsMK);
		m.addAttribute("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
		return "tournamentDetails";
		
	}
	
	@RequestMapping(value= "/removeTournamentDetails/{id}", method = RequestMethod.GET)
	public   ModelAndView removeTournametDetails(Model modelm, @PathVariable int id){
		ModelAndView model = new ModelAndView("tournamentDetails");
		
		Tournament t =this.tournamentService.getTournamentByShortName("JMTOR");
		TournamentDetails tournamentDetails = this.tournamentDetailsService.getTournamentDetailsById(id);
		t.getTournamentDetails().remove(tournamentDetails);
		this.tournamentService.updateTournament(t);
		this.tournamentDetailsService.removeTournamentDetails(id);
		
			
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
		
		TournamentDetails td = new TournamentDetails();
		td.setFormat("RR");
		model.addObject("tournamentDetails", td);
		model.addObject("listTournamentDetails", this.tournamentDetailsService.listTournamentDetails());
		//Authentication authentication =
			//	(Authentication) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
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
	    
	    List<TournamentDetails> tournamentDetailsSM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDM = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDW = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMA = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsSWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDMN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsDWN = new ArrayList<TournamentDetails>();
	    List<TournamentDetails> tournamentDetailsMK = new ArrayList<TournamentDetails>();
	    Set<TournamentDetails> tdetails = t.getTournamentDetails();
	    Iterator<TournamentDetails> iteratorDetails = tdetails.iterator();
	    while(iteratorDetails.hasNext()) {
	    	TournamentDetails tdTemp = iteratorDetails.next();
	    	if (tdTemp.getMode().equals("SM")){
	    		tournamentDetailsSM.add(tdTemp);
	    		this.mode ="SM";
				this.superMode = "S";
	    	}
	    	else if (tdTemp.getMode().equals("SW")){
	    		tournamentDetailsSW.add(tdTemp);
	    		this.mode ="SW";
				this.superMode = "S";
	    	}
	    	else if (tdTemp.getMode().equals("DM")){
	    		tournamentDetailsDM.add(tdTemp);
	    		this.mode ="DM";
				this.superMode = "D";
	    	}
	    	else if (tdTemp.getMode().equals("DW")){
	    		tournamentDetailsDW.add(tdTemp);
	    		this.mode ="DM";
				this.superMode = "D";
	    	}
	    	else if (tdTemp.getMode().equals("MA")){
	    		tournamentDetailsMA.add(tdTemp);
	    		this.mode ="MA";
				this.superMode = "M";
	    	}
	    	else if (tdTemp.getMode().equals("SMN")){
	    		tournamentDetailsSMN.add(tdTemp);
	    		this.mode ="SMN";
				this.superMode = "S";
	    	}
	    	else if (tdTemp.getMode().equals("SWN")){
	    		tournamentDetailsSWN.add(tdTemp);
	    		this.mode ="SWN";
				this.superMode = "S";
	    	}
	    	else if (tdTemp.getMode().equals("DMN")){
	    		tournamentDetailsDMN.add(tdTemp);
	    		this.mode ="DMN";
				this.superMode = "D";
	    	}
	    	else if (tdTemp.getMode().equals("DWN")){
	    		tournamentDetailsDWN.add(tdTemp);
	    		this.mode ="DWN";
				this.superMode = "D";
	    	}
	    	else if (tdTemp.getMode().equals("MK")){
	    		tournamentDetailsMK.add(tdTemp);
	    		this.mode ="MK";
				this.superMode = "M";
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
	    
	    model.addObject("tournamentDetailsSM", tournamentDetailsSM);
	    model.addObject("tournamentDetailsSW", tournamentDetailsSW);
	    model.addObject("tournamentDetailsDM", tournamentDetailsDM);
	    model.addObject("tournamentDetailsDW", tournamentDetailsDW);
	    model.addObject("tournamentDetailsMA", tournamentDetailsMA);
	    model.addObject("tournamentDetailsNMens", tournamentDetailsSMN);
	    model.addObject("tournamentDetailsNWomans", tournamentDetailsSWN);
	    model.addObject("tournamentDetailsNMensD", tournamentDetailsDMN);
	    model.addObject("tournamentDetailsNWomansD", tournamentDetailsDMN);
	    model.addObject("tournamentDetailsMK", tournamentDetailsMK);
		
		
		model.setViewName("redirect:/tournamentDetails");
		
		return model;
		
	}
	
	
}
