class StatusCodeView extends Backbone.View
  initialize: ->

  render: ->
    if @model.codes?
      stuff = ''
      for key of @model.codes
        stuff = stuff + '<tr><td><tt>' + key + '</tt></td><td>' + @model.codes[key] + '</td></tr>'
      @model.reason = @model.reason + '<p/><b><a href="https://zorggemak.atlassian.net/wiki/x/EgArAQ">Code</a>:</b><br/><table class="code">' + stuff + '</table>'
    template = @template()
    $(@el).html(template(@model))
    @

  template: ->
    Handlebars.templates.status_code

