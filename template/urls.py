from django.conf.urls import include, url, patterns
from django.contrib import admin
from django.conf import settings
from demo.views import IndexView, SearchView

urlpatterns = [
    # Examples:
    url(r'^$', IndexView.as_view(), name='home'),
    url(r'^result/$', SearchView.as_view(), name='result'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^search/', "demo.views.search"),
    url(r'^admin/', include(admin.site.urls)),
]

if settings.DEBUG:
    urlpatterns += patterns('',
    (r'^(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT, 'show_indexes': True}),
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
)