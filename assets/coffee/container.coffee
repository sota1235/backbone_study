# container.coffee
#
# Description:
#   manage view pointer
#
# Author:
#   sota1235

App.Container = Backbone.View.extend
  show: (view) ->
    # destroy view now showing
    this.destroyView this.currentView
    # rendor new view
    this.$el.append view.render().$el
    # keep view now showing
    this.currentView = view
  ,
  destroyView: (view) ->
    # do nothing if there is not view
    if !view
      return
    # off the events of view
    view.off()
    # remove view
    view.remove()
  ,
  empty: () ->
    this.destroyView this.currentView
    this.currentView = null
