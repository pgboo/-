# 校园跑腿业务管理系统

## 技术栈

- 后端：Java 1.8 + Spring 5.x + SpringMVC 5.x + MyBatis 3.x
- 前端：JSP + JSTL + Bootstrap 5 + AdminLTE 风格
- 数据库：MySQL 5.7/8.0
- 连接池：Druid
- 构建工具：Maven

## 默认账号

- 管理员：admin / 123456

## 部署步骤

### 1. 创建数据库

使用 MySQL 客户端执行项目根目录下的 SQL 脚本：

```sql
source sql/paotui.sql
```

脚本会自动创建数据库 `paotui` 并导入初始数据。

### 2. 修改数据库配置

编辑 `src/main/resources/db.properties`：

```properties
jdbc.url=jdbc:mysql://localhost:3306/paotui?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai
jdbc.username=root
jdbc.password=你的密码
```

### 3. 构建并运行（无需安装 Tomcat）

项目已集成 Jetty Maven 插件，直接执行即可启动：

```bash
mvn jetty:run
```

启动成功后访问：

- 首页：http://localhost:8081/paotui/
- 登录：http://localhost:8081/paotui/login
- 管理员后台：http://localhost:8081/paotui/admin/index

默认管理员账号：**admin / 123456**

### 4. 部署到 Tomcat（可选）

如果你已安装 Tomcat，也可以将 `target/paotui.war` 复制到 Tomcat 的 `webapps` 目录下启动，访问地址为 `http://localhost:8080/paotui/`。

## 角色说明

1. **用户**：注册登录后可发布跑腿项目、查看接单、确认订单并支付、发布动态分享、查看公告。
2. **跑腿员**：注册登录后可查看可接单项目并接单、管理我的接单、查看确认订单、发布交易反馈。
3. **商家**：注册登录后可发布跑腿项目、管理接单信息（接受/拒绝）、管理提醒信息。
4. **管理员**：拥有全系统管理权限，可管理用户、跑腿员、商家、分类、项目、订单、动态、反馈、公告。

## 核心业务流

用户发布跑腿项目 → 跑腿员接单 → 商家/系统处理接单 → 用户确认订单并支付评分 → 跑腿员发布交易反馈

## 注意事项

- 项目使用 UTF-8 编码，请确保数据库、Tomcat、IDE 均使用 UTF-8。
- 头像和封面图片上传到 `webapp/upload` 目录下。
- 默认管理员账号为 admin/123456，部署后建议及时修改密码。
