# Generated by Django 2.0.6 on 2018-06-15 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dnsoperate', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='dnsrecord',
            old_name='name',
            new_name='domain_name',
        ),
        migrations.AlterField(
            model_name='dnsrecord',
            name='create_time',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='dnsrecord',
            name='delete_time',
            field=models.DateTimeField(null=True, verbose_name='删除时间'),
        ),
        migrations.AlterField(
            model_name='dnsrecord',
            name='request_time',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='记录请求时间，如果后面进来的请求时间小于当前，不做处理'),
        ),
        migrations.AlterField(
            model_name='dnsrecord',
            name='update_time',
            field=models.DateTimeField(auto_now=True, null=True, verbose_name='修改时间'),
        ),
        migrations.AlterField(
            model_name='dnsview',
            name='create_time',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='dnsview',
            name='delete_time',
            field=models.DateTimeField(null=True, verbose_name='删除时间'),
        ),
        migrations.AlterField(
            model_name='dnsview',
            name='update_time',
            field=models.DateTimeField(auto_now=True, null=True, verbose_name='修改时间'),
        ),
        migrations.AlterField(
            model_name='dnszone',
            name='create_time',
            field=models.DateTimeField(auto_now_add=True, null=True, verbose_name='创建时间'),
        ),
        migrations.AlterField(
            model_name='dnszone',
            name='delete_time',
            field=models.DateTimeField(null=True, verbose_name='删除时间'),
        ),
        migrations.AlterField(
            model_name='dnszone',
            name='serial_num',
            field=models.IntegerField(null=True, verbose_name='序列号'),
        ),
        migrations.AlterField(
            model_name='dnszone',
            name='update_time',
            field=models.DateTimeField(auto_now=True, null=True, verbose_name='修改时间'),
        ),
    ]