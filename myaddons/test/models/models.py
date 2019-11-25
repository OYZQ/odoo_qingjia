# -*- coding: utf-8 -*-

from odoo import models, fields, api

class test(models.Model):
    _name = 'test.test'
    name = fields.Char(string="申请人")
    days = fields.Integer(string="天数")
    startdate = fields.Date(string="开始日期")
    enddate = fields.Date(string="截至日期")
    reason = fields.Text(string="请假事由")
#     _name = 'test.test'

#     name = fields.Char()
#     value = fields.Integer()
#     value2 = fields.Float(compute="_value_pc", store=True)
#     description = fields.Text()
#
#     @api.depends('value')
#     def _value_pc(self):
#         self.value2 = float(self.value) / 100