from django.utils import translation
from django.conf import settings
from django.utils.cache import patch_vary_headers
from django.core.urlresolvers import get_resolver, LocaleRegexURLResolver


class LocaleMiddleware(object):

	def process_request(self, request):
		language = request.GET.get('lang')
		
		if request.LANGUAGE_CODE == 'en' and language == None:
			language = 'en'
		elif language not in ('en', 'zh-hans'):
			language = 'zh-hans'

		translation.activate(language)
		request.LANGUAGE_CODE = translation.get_language()


	def process_response(self, request, response):
		if settings.LANGUAGE_COOKIE_NAME not in response.cookies:
			response.set_cookie(settings.LANGUAGE_COOKIE_NAME,translation.get_language())
		patch_vary_headers(response, ('Accept-Language',))
		if 'Content-Language' not in response:
			response['Content-Language'] = translation.get_language()
		translation.deactivate()
		return response
