package com.paotui.controller;

import com.paotui.entity.*;
import com.paotui.service.*;
import com.paotui.util.FileUploadUtil;
import com.paotui.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
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
    private GonggaoService gonggaoService;

    @GetMapping("/index")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);

        Map<String, Object> params = new HashMap<>();
        params.put("userId", user.getId());
        model.addAttribute("myProjectCount", paotuixiangmuService.list(params).size());

        params.clear();
        params.put("userId", user.getId());
        model.addAttribute("myOrderCount", jiedanxinxiService.list(params).size());

        model.addAttribute("gonggaoList", gonggaoService.list(new HashMap<>()));
        return "user/index";
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", userService.getById(user.getId()));
        return "user/profile";
    }

    @PostMapping("/updateProfile")
    public String updateProfile(User user, @RequestParam(value = "file", required = false) MultipartFile file,
                                HttpServletRequest request, HttpSession session) {
        User loginUser = (User) session.getAttribute("user");
        user.setId(loginUser.getId());
        if (file != null && !file.isEmpty()) {
            String path = FileUploadUtil.upload(file, request, "upload");
            user.setAvatar(path);
        }
        userService.update(user);
        session.setAttribute("user", userService.getById(loginUser.getId()));
        return "redirect:/user/profile";
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public R updatePassword(@RequestParam("oldPassword") String oldPassword,
                            @RequestParam("newPassword") String newPassword,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        User dbUser = userService.getById(user.getId());
        if (!dbUser.getPassword().equals(oldPassword)) {
            return R.error("原密码错误");
        }
        User update = new User();
        update.setId(user.getId());
        update.setPassword(newPassword);
        userService.update(update);
        return R.ok("修改成功");
    }

    // 跑腿项目
    @GetMapping("/project/list")
    public String projectList(@RequestParam(value = "keyword", required = false) String keyword,
                              @RequestParam(value = "fenleiId", required = false) Integer fenleiId,
                              HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> params = new HashMap<>();
        params.put("keyword", keyword);
        params.put("fenleiId", fenleiId);
        params.put("userId", user.getId());
        List<Paotuixiangmu> list = paotuixiangmuService.list(params);
        List<Paotuifenlei> fenleiList = paotuifenleiService.all();
        System.out.println("DEBUG projectList userId=" + user.getId() + " listSize=" + list.size());
        if (!list.isEmpty()) {
            Paotuixiangmu first = list.get(0);
            System.out.println("DEBUG first project id=" + first.getId() + " title=" + first.getTitle() + " fenleiName=" + first.getFenleiName() + " status=" + first.getStatus());
        }
        System.out.println("DEBUG fenleiList size=" + fenleiList.size());
        for (Paotuifenlei f : fenleiList) {
            System.out.println("DEBUG fenlei id=" + f.getId() + " name=" + f.getName());
        }
        model.addAttribute("list", list);
        model.addAttribute("fenleiList", fenleiList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("fenleiId", fenleiId);
        return "user/project_list";
    }

    @GetMapping("/project/add")
    public String projectAdd(Model model) {
        List<Paotuifenlei> fenleiList = paotuifenleiService.all();
        System.out.println("DEBUG projectAdd fenleiList size=" + fenleiList.size());
        for (Paotuifenlei f : fenleiList) {
            System.out.println("DEBUG projectAdd fenlei id=" + f.getId() + " name=" + f.getName());
        }
        model.addAttribute("fenleiList", fenleiList);
        return "user/project_add";
    }

    @PostMapping("/project/save")
    public String projectSave(Paotuixiangmu project,
                              @RequestParam(value = "file", required = false) MultipartFile file,
                              HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        project.setUserId(user.getId());
        project.setStatus(0);
        if (file != null && !file.isEmpty()) {
            project.setCover(FileUploadUtil.upload(file, request, "upload"));
        }
        paotuixiangmuService.add(project);
        return "redirect:/user/project/list";
    }

    @GetMapping("/project/edit/{id}")
    public String projectEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("project", paotuixiangmuService.getById(id));
        model.addAttribute("fenleiList", paotuifenleiService.all());
        return "user/project_edit";
    }

    @PostMapping("/project/update")
    public String projectUpdate(Paotuixiangmu project,
                                @RequestParam(value = "file", required = false) MultipartFile file,
                                HttpServletRequest request) {
        if (file != null && !file.isEmpty()) {
            project.setCover(FileUploadUtil.upload(file, request, "upload"));
        }
        paotuixiangmuService.update(project);
        return "redirect:/user/project/list";
    }

    @GetMapping("/project/delete/{id}")
    public String projectDelete(@PathVariable("id") Integer id) {
        paotuixiangmuService.delete(id);
        return "redirect:/user/project/list";
    }

    // 接单信息 / 我的订单
    @GetMapping("/order/list")
    public String orderList(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> params = new HashMap<>();
        params.put("userId", user.getId());
        List<Jiedanxinxi> list = jiedanxinxiService.list(params);
        model.addAttribute("list", list);
        return "user/order_list";
    }

    // 确认订单
    @GetMapping("/order/confirm/{orderId}")
    public String confirmOrder(@PathVariable("orderId") Integer orderId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Jiedanxinxi order = jiedanxinxiService.getById(orderId);
        if (order == null || !order.getUserId().equals(user.getId()) || order.getStatus() != 4) {
            return "redirect:/user/order/list";
        }
        model.addAttribute("order", order);
        return "user/order_confirm";
    }

    @PostMapping("/order/doConfirm")
    public String doConfirm(Querendingdan confirm,
                            @RequestParam("orderId") Integer orderId,
                            HttpSession session) {
        User user = (User) session.getAttribute("user");
        Jiedanxinxi order = jiedanxinxiService.getById(orderId);
        if (order == null || !order.getUserId().equals(user.getId()) || order.getStatus() != 4) {
            return "redirect:/user/order/list";
        }
        confirm.setOrderNo(order.getOrderNo());
        confirm.setProjectId(order.getProjectId());
        confirm.setUserId(user.getId());
        confirm.setUserName(user.getName());
        confirm.setUserPhone(user.getPhone());
        confirm.setPaotuiId(order.getPaotuiId());
        confirm.setPaotuiName(order.getPaotuiName());
        confirm.setTargetAddress(order.getTargetAddress());
        confirm.setFee(order.getFee());
        confirm.setConfirmTime(new Date());
        confirm.setIsPay(0);
        querendingdanService.confirm(confirm);

        // 更新项目状态为已完成
        paotuixiangmuService.updateStatus(order.getProjectId(), 2);
        jiedanxinxiService.complete(order.getId());
        return "redirect:/user/order/list";
    }

    // 确认订单管理
    @GetMapping("/confirm/list")
    public String confirmList(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> params = new HashMap<>();
        params.put("userId", user.getId());
        List<Querendingdan> list = querendingdanService.list(params);
        model.addAttribute("list", list);
        return "user/confirm_list";
    }

    @GetMapping("/confirm/pay/{id}")
    public String confirmPay(@PathVariable("id") Integer id) {
        querendingdanService.pay(id);
        return "redirect:/user/confirm/list";
    }

    // 动态分享
    @GetMapping("/dongtai/list")
    public String dongtaiList(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        Map<String, Object> params = new HashMap<>();
        params.put("userId", user.getId());
        List<Dongtaifenxiang> list = dongtaifenxiangService.list(params);
        model.addAttribute("list", list);
        return "user/dongtai_list";
    }

    @GetMapping("/dongtai/add")
    public String dongtaiAdd() {
        return "user/dongtai_add";
    }

    @PostMapping("/dongtai/save")
    public String dongtaiSave(Dongtaifenxiang dongtai, HttpSession session) {
        User user = (User) session.getAttribute("user");
        dongtai.setUserId(user.getId());
        dongtai.setUserName(user.getName());
        dongtai.setViewCount(0);
        dongtaifenxiangService.add(dongtai);
        return "redirect:/user/dongtai/list";
    }

    @GetMapping("/dongtai/edit/{id}")
    public String dongtaiEdit(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("dongtai", dongtaifenxiangService.getById(id));
        return "user/dongtai_edit";
    }

    @PostMapping("/dongtai/update")
    public String dongtaiUpdate(Dongtaifenxiang dongtai) {
        dongtaifenxiangService.update(dongtai);
        return "redirect:/user/dongtai/list";
    }

    @GetMapping("/dongtai/delete/{id}")
    public String dongtaiDelete(@PathVariable("id") Integer id) {
        dongtaifenxiangService.delete(id);
        return "redirect:/user/dongtai/list";
    }

    // 公告
    @GetMapping("/gonggao/list")
    public String gonggaoList(Model model) {
        model.addAttribute("list", gonggaoService.list(new HashMap<>()));
        return "user/gonggao_list";
    }
}
