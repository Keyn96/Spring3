/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import dao.MaterialDAO;
import domain.Material;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author НР
 */
@Controller
@RequestMapping("/material")
public class MaterialController {

    @Autowired
    private MaterialDAO dao;

    @RequestMapping(value = "/selectAll", method = RequestMethod.GET)
    public String selectMaterials(Model model) {
        model.addAttribute("materials", dao.selectMaterials());
        return "/material/selectAll";
    }

    @RequestMapping(value = "/{id_material}/selectId", method = RequestMethod.GET)
    public String selectMaterial(@PathVariable("id_material") int id_material, Model model) {
        Material material = dao.selectMaterial(id_material);
        if (material == null) {
            throw new NotFoundException();
        }
        model.addAttribute("material", material);
        return "/material/select";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insertMaterial(Model model) {
        model.addAttribute("title", "Добавление материала");
        model.addAttribute("send", "/material/insert");
        return "/material/table";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insertMaterial(@ModelAttribute Material material, Model model) {
        dao.insertMaterial(material);
        return "redirect:/material/selectAll";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String updateMaterial(@PathVariable("id_material") int id_material, Model model) {
        Material material = dao.selectMaterial(id_material);
        if (material == null) {
            throw new NotFoundException();
        }
        model.addAttribute("title", "Редактирование материала");
        model.addAttribute("send", "/material/update");
        model.addAttribute("material", "material");
        return "/material/table";
    }

    @RequestMapping(value = "/updateMaterial", method = RequestMethod.POST)
    public String updateMaterial(@ModelAttribute Material material, Model model) {
        if (dao.updateMaterial(material)) {
            return "redirect:/material/selectAll";
        } else {
            return "redirect:/error";
        }
    }

    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String deleteMaterial(@PathVariable("id_material") int id_material, Model model) {
        Material material = dao.selectMaterial(id_material);
        if (material == null) {
            throw new NotFoundException();
        }
        model.addAttribute("material", "material");
        return "/material/delete";
    }

    @RequestMapping(value = "/deleteMaterial", method = RequestMethod.POST)
    public String deleteMaterialPost(@PathVariable("id_material") int id_material, Model model) {
        if (dao.deleteMaterial(dao.selectMaterial(id_material))) {
            return "redirect:/material/selectAll";
        } else {
            return "redirect:/error";
        }
    }
    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Entity with specified id not found")
    public void handleNotFoundException(NotFoundException ex, HttpServletResponse response) throws IOException{
        
    }

}
