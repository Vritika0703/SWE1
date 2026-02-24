from django.contrib import admin
from .models import Question, Choice

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3
    min_num = 2
    fields = ['choice_text', 'votes']
    
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question_text', 'pub_date', 'was_published_recently', 'get_choices_count')
    list_filter = ['pub_date']
    search_fields = ['question_text']
    list_per_page = 10
    ordering = ['-pub_date']
    
    fieldsets = [
        (None, {
            'fields': ['question_text'],
            'classes': ['wide']
        }),
        ('Date information', {
            'fields': ['pub_date'],
            'classes': ['collapse']
        }),
    ]
    
    inlines = [ChoiceInline]
    
    def was_published_recently(self, obj):
        return obj.was_published_recently()
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'
    
    def get_choices_count(self, obj):
        return obj.choice_set.count()
    get_choices_count.short_description = 'Number of choices'

class ChoiceAdmin(admin.ModelAdmin):
    list_display = ('choice_text', 'question', 'votes')
    list_filter = ['question']
    search_fields = ['choice_text']
    list_per_page = 20
    ordering = ['-votes']

# Customize admin site
admin.site.site_header = 'Django Polls Administration'
admin.site.site_title = 'Polls Admin'
admin.site.index_title = 'Welcome to Polls Administration'

admin.site.register(Question, QuestionAdmin)
admin.site.register(Choice, ChoiceAdmin)