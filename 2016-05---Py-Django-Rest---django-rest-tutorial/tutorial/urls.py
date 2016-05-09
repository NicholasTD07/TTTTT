from django.conf.urls import url, include


from rest_framework import routers
from rest_framework.urlpatterns import format_suffix_patterns


from tutorial.quickstart import views as q_views
from snippets import views

# router = routers.DefaultRouter()
# router.register(r'users', q_views.UserViewSet)
# router.register(r'groups', q_views.GroupViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    # url(r'^', include(router.urls)),
    # url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^snippets/$', views.SnippetList.as_view()),
    url(r'^snippets/(?P<pk>[0-9]+)/$', views.SnippetDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
