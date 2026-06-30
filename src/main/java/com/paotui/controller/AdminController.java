package com.paotui.controller;

import com.paotui.entity.*;
import com.paotui.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;
    @Autowired
    private PaotuiService paotuiService;
    @Autowired
    private ShangjiaService shangjiaService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private PaotuifenleiService paotuifenleiService;
    @Autowired
    private PaotuixiangmuService paotuixiangmuService;
    @Autowired
    private JiedanxinxiService jiedanxinxiService;
    @Autowired
    private QuerendingdanService querendingdanService;
    @Autowired
    private DongtaifenxiangService dongtaifenxiangService;
    @Autowired
    private JiaoyifankuiService jiaoyifankuiService;
    @Autowired
    private GonggaoService gonggaoService;

    @GetMapping("/index")
    public String index(HttpSession session, Model model) {
        List<User> userList = userService.list(new HashMap<>());
        List<Paotui> paotuiList = paotuiService.list(new HashMap<>());
        List<Shangjia> shangjiaList = shangjiaService.list(new HashMap<>());
        List<Paotuixiangmu> projectList = paotuixiangmuService.list(new HashMap<>());
        List<Jiedanxinxi> orderList = jiedanxinxiService.list(new HashMap<>());
        List<Dongtaifenxiang> dongtaiList = dongtaifenxiangService.list(new HashMap<>());
        List<Gonggao> gonggaoList = gonggaoService.list(new HashMap<>());

        model.addAttribute("userCount", userList.size());
        model.addAttribute("paotuiCount", paotuiList.size());
        model.addAttribute("shangjiaCount", shangjiaList.size());
        model.addAttribute("projectCount", projectList.size());
        model.addAttribute("orderCount", orderList.size());
        model.addAttribute("dongtaiCount", dongtaiList.size());

        // 项目状态统计 0待接单 1已接单 2已完成
        long projectPending = projectList.stream().filter(p -> p.getStatus() != null && p.getStatus() == 0).count();
        long projectAccepted = projectList.stream().filter(p -> p.getStatus() != null && p.getStatus() == 1).count();
        long projectCompleted = projectList.stream().filter(p -> p.getStatus() != null && p.getStatus() == 2).count();
        model.addAttribute("projectPending", projectPending);
        model.addAttribute("projectAccepted", projectAccepted);
        model.addAttribute("projectCompleted", projectCompleted);

        // 接单状态统计 0待处理 1已接受 2已拒绝 3已完成
        long orderPending = orderList.stream().filter(o -> o.getStatus() != null && o.getStatus() == 0).count();
        long orderAccepted = orderList.stream().filter(o -> o.getStatus() != null && o.getStatus() == 1).count();
        long orderRejected = orderList.stream().filter(o -> o.getStatus() != null && o.getStatus() == 2).count();
        long orderDone = orderList.stream().filter(o -> o.getStatus() != null && o.getStatus() == 3).count();
        model.addAttribute("orderPending", orderPending);
        model.addAttribute("orderAccepted", orderAccepted);
        model.addAttribute("orderRejected", orderRejected);
        model.addAttribute("orderDone", orderDone);

        // 最近公告
        if (gonggaoList.size() > 5) {
            gonggaoList = gonggaoList.subList(0, 5);
        }
        model.addAttribute("gonggaoList", gonggaoList);

        return "admin/index";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        Admin admin = (Admin) session.getAttribute("admin");
        model.addAttribute("admin", adminService.getById(admin.getId()));
        return "admin/profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(Admin admin, HttpSession session) {
        Admin login = (Admin) session.getAttribute("admin");
        admin.setId(login.getId());
        adminService.update(admin);
        session.setAttribute("admin", adminService.getById(login.getId()));
        return "redirect:/admin/profile";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("password") String password, HttpSession session) {
        Admin login = (Admin) session.getAttribute("admin");
        Admin admin = new Admin();
        admin.setId(login.getId());
        admin.setPassword(password);
        adminService.update(admin);
        return "redirect:/admin/profile";
    }

    // 用户管理
    @GetMapping("/user/list")
    public String userList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", userService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/user_list";
    }

    @GetMapping("/user/add")
    public String userAdd() {
        return "admin/user_add";
    }

    @PostMapping("/user/save")
    public String userSave(User user) {
        userService.add(user);
        return "redirect:/admin/user/list";
    }

    @GetMapping("/user/edit/{id}")
    public String userEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("user", userService.getById(id));
        return "admin/user_edit";
    }

    @PostMapping("/user/update")
    public String userUpdate(User user) {
        userService.update(user);
        return "redirect:/admin/user/list";
    }

    @GetMapping("/user/delete/{id}")
    public String userDelete(@PathVariable("id") Integer id) {
        userService.delete(id);
        return "redirect:/admin/user/list";
    }

    // 跑腿员管理
    @GetMapping("/paotui/list")
    public String paotuiList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", paotuiService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/paotui_list";
    }

    @GetMapping("/paotui/add")
    public String paotuiAdd() {
        return "admin/paotui_add";
    }

    @PostMapping("/paotui/save")
    public String paotuiSave(Paotui paotui) {
        paotuiService.add(paotui);
        return "redirect:/admin/paotui/list";
    }

    @GetMapping("/paotui/edit/{id}")
    public String paotuiEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("paotui", paotuiService.getById(id));
        return "admin/paotui_edit";
    }

    @PostMapping("/paotui/update")
    public String paotuiUpdate(Paotui paotui) {
        paotuiService.update(paotui);
        return "redirect:/admin/paotui/list";
    }

    @GetMapping("/paotui/delete/{id}")
    public String paotuiDelete(@PathVariable("id") Integer id) {
        paotuiService.delete(id);
        return "redirect:/admin/paotui/list";
    }

    // 商家管理
    @GetMapping("/shangjia/list")
    public String shangjiaList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", shangjiaService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/shangjia_list";
    }

    @GetMapping("/shangjia/add")
    public String shangjiaAdd() {
        return "admin/shangjia_add";
    }

    @PostMapping("/shangjia/save")
    public String shangjiaSave(Shangjia shangjia) {
        shangjiaService.add(shangjia);
        return "redirect:/admin/shangjia/list";
    }

    @GetMapping("/shangjia/edit/{id}")
    public String shangjiaEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("shangjia", shangjiaService.getById(id));
        return "admin/shangjia_edit";
    }

    @PostMapping("/shangjia/update")
    public String shangjiaUpdate(Shangjia shangjia) {
        shangjiaService.update(shangjia);
        return "redirect:/admin/shangjia/list";
    }

    @GetMapping("/shangjia/delete/{id}")
    public String shangjiaDelete(@PathVariable("id") Integer id) {
        shangjiaService.delete(id);
        return "redirect:/admin/shangjia/list";
    }

    // 分类管理
    @GetMapping("/fenlei/list")
    public String fenleiList(Model model) {
        model.addAttribute("list", paotuifenleiService.all());
        return "admin/fenlei_list";
    }

    @PostMapping("/fenlei/save")
    public String fenleiSave(Paotuifenlei fenlei) {
        paotuifenleiService.add(fenlei);
        return "redirect:/admin/fenlei/list";
    }

    @PostMapping("/fenlei/update")
    public String fenleiUpdate(Paotuifenlei fenlei) {
        paotuifenleiService.update(fenlei);
        return "redirect:/admin/fenlei/list";
    }

    @GetMapping("/fenlei/delete/{id}")
    public String fenleiDelete(@PathVariable("id") Integer id) {
        paotuifenleiService.delete(id);
        return "redirect:/admin/fenlei/list";
    }

    // 跑腿项目管理
    @GetMapping("/project/list")
    public String projectList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", paotuixiangmuService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/project_list";
    }

    @GetMapping("/project/edit/{id}")
    public String projectEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("project", paotuixiangmuService.getById(id));
        model.addAttribute("fenleiList", paotuifenleiService.all());
        return "admin/project_edit";
    }

    @PostMapping("/project/update")
    public String projectUpdate(Paotuixiangmu project) {
        paotuixiangmuService.update(project);
        return "redirect:/admin/project/list";
    }

    @GetMapping("/project/delete/{id}")
    public String projectDelete(@PathVariable("id") Integer id) {
        paotuixiangmuService.delete(id);
        return "redirect:/admin/project/list";
    }

    // 接单信息管理
    @GetMapping("/order/list")
    public String orderList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", jiedanxinxiService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/order_list";
    }

    @GetMapping("/order/delete/{id}")
    public String orderDelete(@PathVariable("id") Integer id) {
        jiedanxinxiService.delete(id);
        return "redirect:/admin/order/list";
    }

    // 确认订单管理
    @GetMapping("/confirm/list")
    public String confirmList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", querendingdanService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/confirm_list";
    }

    @GetMapping("/confirm/delete/{id}")
    public String confirmDelete(@PathVariable("id") Integer id) {
        querendingdanService.delete(id);
        return "redirect:/admin/confirm/list";
    }

    // 动态分享管理
    @GetMapping("/dongtai/list")
    public String dongtaiList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", dongtaifenxiangService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/dongtai_list";
    }

    @GetMapping("/dongtai/delete/{id}")
    public String dongtaiDelete(@PathVariable("id") Integer id) {
        dongtaifenxiangService.delete(id);
        return "redirect:/admin/dongtai/list";
    }

    // 交易反馈管理
    @GetMapping("/fankui/list")
    public String fankuiList(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        model.addAttribute("list", jiaoyifankuiService.list(params));
        model.addAttribute("keyword", keyword);
        return "admin/fankui_list";
    }

    @GetMapping("/fankui/delete/{id}")
    public String fankuiDelete(@PathVariable("id") Integer id) {
        jiaoyifankuiService.delete(id);
        return "redirect:/admin/fankui/list";
    }

    // 公告管理
    @GetMapping("/gonggao/list")
    public String gonggaoList(Model model) {
        model.addAttribute("list", gonggaoService.list(new HashMap<>()));
        return "admin/gonggao_list";
    }

    @PostMapping("/gonggao/save")
    public String gonggaoSave(Gonggao gonggao) {
        gonggaoService.add(gonggao);
        return "redirect:/admin/gonggao/list";
    }

    @PostMapping("/gonggao/update")
    public String gonggaoUpdate(Gonggao gonggao) {
        gonggaoService.update(gonggao);
        return "redirect:/admin/gonggao/list";
    }

    @GetMapping("/gonggao/delete/{id}")
    public String gonggaoDelete(@PathVariable("id") Integer id) {
        gonggaoService.delete(id);
        return "redirect:/admin/gonggao/list";
    }
}
