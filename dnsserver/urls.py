"""dnsserver URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from dnsoperate.views import dns_manage

from django.conf.urls import include, url

reg = '^(?=^.{3,255}$)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+$'

urlpatterns = [
    path('admin/', admin.site.urls),

    #dns 操作
    # url(r'^api/v1/dns/(?P<zone_name>\%s)/(?P<domain_name>\w+)/$'%reg, dns_manage, name='dns管理'),
    # url(r'^api/v1/dns/(?P<zone_name>^(?=^.{3,255}$)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+$)/(?P<domain_name>\\w+)/$', dns_manage, name="dns管理")
    url(r'^api/v1/dns/(?P<zone_name>\^(?=^.{3,255}$)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+$)/$', dns_manage, name="dns管理")
]
