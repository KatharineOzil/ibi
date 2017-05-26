from django.utils import translation
from django.conf import settings
from django.utils.cache import patch_vary_headers
from django.core.urlresolvers import get_resolver, LocaleRegexURLResolver


class LocaleMiddleware(object):

	def process_request(self, request):
		language = request.GET.get('lang')
		if language is None:
		    language = request.COOKIES.get('django_language')

		if language is not None:
		    if not language == 'en':
		        language = 'zh-Hans'
                else:
                    language = 'zh-Hans'
		translation.activate(language)
		request.LANGUAGE_CODE = translation.get_language()


	def process_response(self, request, response):
		patch_vary_headers(response, ('Accept-Language',))
		if 'Content-Language' not in response:
			response['Content-Language'] = translation.get_language()

		if request.GET.get('lang') is not None:
			response.set_cookie(settings.LANGUAGE_COOKIE_NAME, request.LANGUAGE_CODE)

		translation.deactivate()
		return response
