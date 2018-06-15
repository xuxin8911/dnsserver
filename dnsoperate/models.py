from django.db import models

# Create your models here.

IS_DELETE = (
    (0, '未删除'),
    (1, '已删除')
)
class DnsView(models.Model):
    id = models.AutoField(primary_key=True)
    server = models.CharField(verbose_name='server地址', max_length=255)
    view = models.CharField(verbose_name='view名称', max_length=255)
    keyring = models.CharField(verbose_name='view key', max_length=255)
    zone_id = models.IntegerField('zoneid')
    update_time = models.DateTimeField(verbose_name='修改时间', auto_now=True, null=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True, null=True)
    delete_time = models.DateTimeField(verbose_name='删除时间', null=True)
    is_delete = models.IntegerField(choices=IS_DELETE, default=0)

class DnsZone(models.Model):
    id = models.AutoField(primary_key=True)
    zone_name = models.CharField(verbose_name='zone名称', max_length=255, null=False)
    serial_num = models.IntegerField(verbose_name='序列号', null=True)
    update_time = models.DateTimeField(verbose_name='修改时间', auto_now=True, null=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True, null=True)
    delete_time = models.DateTimeField(verbose_name='删除时间', null=True)
    is_delete = models.IntegerField(choices=IS_DELETE, default=0)

class DnsRecord(models.Model):
    id = models.AutoField(primary_key=True)
    domain_name = models.CharField(verbose_name='记录名称', max_length=255)
    record_type = models.CharField(verbose_name='记录类型', max_length=32)
    ttl = models.IntegerField(verbose_name='记录缓存生存时间')
    record_value = models.TextField(verbose_name='记录值')
    view_id = models.IntegerField('view id')
    zone_id = models.IntegerField('view id')
    request_time = models.DateTimeField(verbose_name='记录请求时间，如果后面进来的请求时间小于当前，不做处理', auto_now_add=True, null=True)
    request_ip = models.GenericIPAddressField(verbose_name='请求IP', protocol='ipv4')
    update_time = models.DateTimeField(verbose_name='修改时间', auto_now=True, null=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True, null=True)
    delete_time = models.DateTimeField(verbose_name='删除时间', null=True)
    is_delete = models.IntegerField(choices=IS_DELETE, default=0)

class DnsOperateLog(models.Model):
    OPERATE_TYPE = (
        ('POST', '增加'),
        ('DELETE', '删除'),
        ('GET', '查询'),
        ('PUT', '修改')
    )
    STATUS = (
        (0, '失败'),
        (1, '成功')
    )
    id = models.AutoField(primary_key=True)
    operate_user = models.CharField(verbose_name='记录名称', max_length=255)
    request_ip = models.GenericIPAddressField(verbose_name='请求ip', protocol='ipv4')
    operate_url = models.URLField(verbose_name='操作url')
    operate_type = models.CharField(verbose_name='操作类型', max_length=8, choices=OPERATE_TYPE)
    params = models.TextField(verbose_name='入参')
    status = models.CharField(verbose_name='返回状态', max_length=8, choices=STATUS)
    start_time = models.DateTimeField(verbose_name='调用开始时间')
    end_time = models.DateTimeField(verbose_name='调用结束时间')
    message = models.TextField(verbose_name='异常返回结果')
    result = models.TextField(verbose_name='接口返回结果')