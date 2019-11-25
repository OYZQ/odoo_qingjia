## 项目github地址，以及odoo绿色版
项目地址:https://github.com/OYZQ/odoo_qingjia
把`myaddons`文件下的`test`文件删除就是纯净的odoo绿色版
## 启动数据库服务器，新建一个模块
这里我使用的绿色版的odoo10，点击`start-pg.bat`打开pg数据库，在点击`mkmodule_for_Green_odoo.bat`新建一个`qingjia`模块
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191125090508806.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDY4NTUw,size_16,color_FFFFFF,t_70)
## 打开PyCharm
打开PyCharm会看到`qingjia`模块已经生成了
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191125091017305.png)
## 修改_manifest_.py文件

```python
# -*- coding: utf-8 -*-
{
    'name': "qingjia",

    'summary': """
        qingjia""",

    'description': """
        qingjia
    """,

    'author': "ouyang",
    'website': "http://www.oyzq.club",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/master/openerp/addons/base/module/module_data.xml
    # for the full list
    'category': 'Uncategorized',
    'version': '0.1',

    # any module necessary for this one to work correctly
    'depends': ['base'],

    # always loaded
    'data': [
        # 'security/ir.model.access.csv',
        'views/views.xml',
        'views/templates.xml',
    ],
    # only loaded in demonstration mode
    'demo': [
        'demo/demo.xml',
    ],
}
```
>depends属性可以拥有其他需要的模块列表。当安装此模块时，Odoo将自动安装它们。这
>不是一个强制性的属性，但建议总是拥有它。如果不需要特殊的依赖关系，那么我们应该依
>赖于核心base模块。
>您应该注意确保在这里显式地设置所有依赖项;否则，该模块可能无法在干净的数据库中安
>装(由于缺少依赖关系)，或者在随后加载其他必需的模块时加载错误。
>对于我们的应用程序，我们不需要任何特定的依赖项，因此我们依赖于base模块。
>summary 显示为模块的副标题。
>version 默认情况下，是l.0。它应该遵循语义版本规则(参见 http://semver.org/
>以获得详细信息)。
>license 标识符默认是LGPL–3。
>website 是一个URL，用于查找关于模块的更多信息。这可以帮助人们找到更多的
>文档或问题跟踪器来归档bug和建议。
>category 是模块的功能类别，默认为未分类。在Application字段下拉列表中，可
>以在安全组表单(Settings | User | Groups)中找到现有类别的列表。

## 修改模块的类文件 `models/models.py`

```python
# -*- coding: utf-8 -*-

from odoo import models, fields, api

class qingjiadan(models.Model):
    _name = 'qingjia.qingjiadan'
    name = fields.Char(string="申请人")
    days = fields.Integer(string="天数")
    startdate = fields.Date(string="开始日期")
    enddate = fields.Date(string="截至日期")
    reason = fields.Text(string="请假事由")
```
>第一行是一个特殊的标记，它告诉Python解释器这个文件有UTF-8，这样它就可以预期和处理
>non-ASCII字符。我们不会使用任何东西，但无论如何这是一个很好的实践。
>第二行是Python代码导入语句，可以从Odoo内核中获取models,fields和api对象。
>第三行声明了我们的新模型。这是一个来自models.Model的类。
>下一行设置了定义标识符的_name属性，该属性将在整个Odoo中使用，以引用该模型。
>下面包含五个属性，name，days，startdate，enddate，reason。在模块安装完成后，odoo的ORM框架会自动把这个对象映射到数据库表。属性类型会映射到表字段数据类型，表名是`模块名_对象名`，比如这个对象对应的表名是`qingjia_qingjiadan`

## 修改资源文件 views/views.xml

```python
<openerp>
  <data>
    <!-- tree视图 -->         
    <record id="view_tree_qingjia_qingjiadan" model="ir.ui.view">
      <field name="name">请假单列表</field>
      <field name="model">qingjia.qingjiadan</field>
      <field name="arch" type="xml">
        <tree>
          <field name="name"/>
          <field name="days"/>
          <field name="startdate"/>
          <field name="enddate"/>
        </tree>
      </field>
    </record>

    <!-- form视图 -->
    <record id="view_form_test_test" model="ir.ui.view">
      <field name="name">员工请假单</field>
      <field name="model">test.test</field>
      <field name="arch" type="xml">
        <form>
          <sheet>
            <group name="group_top" string="员工请假单">
              <field name="name"/>
              <field name="days"/>
              <field name="startdate"/>
              <field name="enddate"/>
              <field name="reason"/>
            </group>
          </sheet>
        </form>
      </field>
    </record>

    <!-- 视图动作 -->
    <act_window id="action_qingjia_qingjiadan"
                   name="请假单"
                   res_model="qingjia.qingjiadan"
                   view_mode="tree,form" />
    
    <!-- 顶级菜单 -->
    <menuitem name="请假" id="menu_qingjia"/>

    <!-- 二级菜单 -->
    <menuitem name="请假单" id="menu_qingjia_qingjiadan" parent="menu_qingjia" action="action_qingjia_qingjiadan"/>

  </data>
</openerp>
```
>这里定义了一个tree视图，一个form视图，一个视图动作，还有两个菜单。
>tree视图用于显示请假单列表页面。
>`<record id="view_tree_qingjia_qingjiadan" model="ir.ui.view">`
>id tree视图的全局唯一标识
>model 资源类型，tree视图和form视图都是ir.ui.view，这里对应ir_ui_view数据库表，模块安装后，资源数据会写入对应的数据库表中。
>`<field name="model">qingjia.qingjiadan</field>`
>将这个视图与我们之前定义的对象模型qingjia.qingjiadan进行绑定。
>\<act_window>元素定义了一个客户端窗口操作，可以打开qingjia.qingjiadan模型，并
>在这个顺序中启用了tree和form视图。
>\<menuitem>定义了一个顶级菜单项，调用action_qingjia_qingjiadan操作，这是以前定
>义的。

```python
<field name="arch" type="xml">
        <tree>
            <field name="name"/>
            <field name="days"/>
            <field name="startdate"/>
        </tree>
</field>
```
>这里表示这是一个tree视图，并定义列表项显示的列。在列表项中显示name,days,startdate,enddate四个字段的内容，这里字段都是在qingjia.qingjiadan对象模型中定义的。
>form视图用于显示请假单详情页，定义方式与tree视图类似。有两个特殊的容器\<sheet>\<group>是用于页面布局的。

```python
    <act_window id="action_qingjia_qingjiadan"
                   name="请假单"
                   res_model="qingjia.qingjiadan"
                   view_mode="tree,form" />
```
>这里定义视图动作，视图动作将菜单、视图、模型进行关联。
>name 会在模块的导航条中显示
>res_model 视图动作绑定的模型
>view_mode 视图动作关联的视图类型

```python
    <!-- 顶级菜单 -->
    <menuitem name="请假" id="menu_qingjia"/>

    <!-- 二级菜单 -->
    <menuitem name="请假单" id="menu_qingjia_qingjiadan" parent="menu_qingjia" action="action_qingjia_qingjiadan"/>
```
>这里定义了两级菜单，顶级菜单将出现在`odoo`导航菜单上，二级菜单的通过`parent`属性与顶级菜单关联，`action`是菜单点击动作响应方法。

修改完代码后，重启odoo服务，重新登录系统，在应用>应用中再次找到我们之前安装过的qingjia模块，进入模块详情，把qingjia模块升级。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191125092752703.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDY4NTUw,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20191125092811479.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyMDY4NTUw,size_16,color_FFFFFF,t_70)
进入模块啊，可以看到请假模块界面和请假条的界面，试验功能能实现基本的增删改查功能。