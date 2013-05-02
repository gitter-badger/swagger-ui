class StatusCodeView extends Backbone.View
  initialize: ->

  render: ->
    if @model.codes?
      stuff = ''
      codes = @model.codes
      for key of codes
        stuff = stuff + '<tr><td class="code">' + key + '</td><td>' + codes[key] + '</td></tr>'
      @model.reason = @model.reason + '<p/><b><a href="https://zorggemak.atlassian.net/wiki/x/EgArAQ">Code</a>:</b><br/><table><tbody>' + stuff + '</tbody></table>'
    template = @template()
    $(@el).html(template(@model))
    @

  template: ->
    Handlebars.templates.status_code

