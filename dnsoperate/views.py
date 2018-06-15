from django.shortcuts import render
import dns
from dnsoperate.models import DnsView, DnsZone, DnsRecord, DnsOperateLog
from django.http import HttpResponse
import json
# Create your views here.

TTL = 60

def get_json_response(success, message='ok', data={}):
    return json.dumps(dict(success=success, message=message, data=data))

def dns_manage(request, zone_name, domain_name):
    http_method = request.META['REQUEST_METHOD']
    if http_method.upper() == 'POST':
        return dns_add(request, zone_name, domain_name)
    elif http_method.upper() == 'GET':
        return HttpResponse(get_json_response('false', 'zone name is not exist!'))
    # dns_add(request, zone_name, domain_name)

def dns_add(request, zone_name, domain_name):
    '''
    添加view
    :param request:

     {
        "record_type": "A",
        "record_value": [
            {"view": "CNSZ17", "ipaddr": "10.202.32.11"},
            {"view": "CNSZ20", "ipaddr": "10.202.32.11"},
        ]
    }
    :param zone_name: intsit.sfdc.com.cn
    :param domain_name: test
    :return:
        {
        "success": 'true',
        'message': 'ok',
        'data': {}
    }
    '''
    #判断zone_name是否存在，查表，如果不存在返回
    zone_ret = DnsZone.objects.filter(zone_name = zone_name)
    if not zone_ret:
        return HttpResponse(get_json_response('false', 'zone name is not exist!'))
    else:
        zone_id = zone_ret.id
    #判断view_name是否存在，通过接口查询，如果不存在返回
    record_type = request.GET('record_type')
    recode_value = request.GET('record_value')
    zone_view_match = False
    def update_dns(domain_name ,ttl, record_type, ipaddr, server_ip):
        keyring = dns.tsigkeyring.from_text(view_keyring)
        update = dns.update.Update(zone_name, keyring=keyring)
        update.add(domain_name, 60, record_type, "10.1.1.1")  # 60 TTL
        response = dns.query.tcp(update, '127.0.0.1')
    for i in recode_value:
        view, ipaddr = i['view'], i['ipaddr']
        view_ret = DnsView.objects.all().filter(view=view)
        view_keyring = view_ret[3]
        if zone_id == view_ret[4]:
            update_dns(domain_name, TTL, record_type, ipaddr, view_ret)
    return get_json_response('true','OK')

def dnsview_update(request):
    '''
    修改view
    :param request:
    :return:
    '''

def get_dnsviews(request):
    '''
    获取view列表
    :param request:
    :return:
    '''

def show_dnsview(request):
    '''
    显示view详细信息
    :param request:
    :return:
    '''

def dnsview_delete(request):
    '''
    删除view
    :param request:
    :return:
    '''