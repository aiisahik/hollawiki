$(function(){

   window.NodeModel = Backbone.Model.extend({
   });

   window.Nodes = Backbone.Collection.extend({
      model: NodeModel,
      url: '/tree'

   });


   window.Scenario = Backbone.Model.extend({

   });

   window.Scenarios = Backbone.Collection.extend({
      model: Scenario,
      url: '/scenarios'
   });




   window.ScenarioView = Backbone.View.extend({

      tagName: 'ul',
      className: 'scenarios-nav',

      initialize: function() {
         _.bindAll(this, 'render');


         window.template = _.template($("#scenarios-template").html());


         this.collection.bind('reset', this.render);
      },

      render: function() {

         var $domInsertPoint = $('#scenarios_list');

         var renderedContent = window.template(this.collection.toJSON()[0]) ;
         $domInsertPoint.html(renderedContent);

         return this;
      }

   });

   var AppRouter = Backbone.Router.extend({
      routes: {
         '': 'home'


      },

      initialize: function() {
         // should instantiate root level views
         window.scenarioslist = new Scenarios();


         window.scenarioView = new ScenarioView({
            collection: window.scenarioslist
         });



      },

      home: function() {
         //         var $container = $('#container');
         //         $container.empty();
         //         $container.append(this.libraryView.render().el)
         window.scenarioslist.fetch();
         //window.scenarioView.render();

      }

   });

   $(function() {
      var app = new AppRouter();
      Backbone.history.start();

   });
//
//   ScenarioView = Backbone.View.extend({
//      el: $("#scenario_nav"),
//      initialize: function() {
//
//         var currentTree = new TreeCollection();
//         currentTree.url = '/tree/'+1;
//         currentTree.fetch();
//
//         var allScenarios = new ScenarioCollection();
//         allScenarios.fetch();
//
//
//         //console.log(allScenarios.map()); // Returns 'value' from default.
//         console.log(allScenarios.attributes); // Inspect the attributes for the model and see that attrA does not have updated value.
//         $('ul', this.el).append("<li>"+item.get('part1')+" "+item.get('part2')+"</li>");
//
//      },
//      render: function() {
//         this.$el.html(this.template(this.model.toJSON()));
//         //this.$el.toggleClass('done', this.model.get('done'));
//         //this.input = this.$('.edit');
//         return this;
//      }
//   });
//
//
//
//   var AppView = Backbone.View.extend({
//      // Instead of generating a new element, bind to the existing skeleton of
//      // the App already present in the HTML.
//      el: $("#bb_app"),
//
//      // Our template for the line of statistics at the bottom of the app.
////      statsTemplate: _.template($('#stats-template').html()),
//
//      // Delegated events for creating new items, and clearing completed ones.
////      events: {
////         "keypress #new-todo":  "createOnEnter",
////         "keyup #new-todo":     "showTooltip",
////         "click .todo-clear a": "clearCompleted"
////      },
//
//      initialize: function() {
//         this.input    = this.$("#new-scenario");
////         Todos.bind('add',   this.addOne, this);
////         Todos.bind('reset', this.addAll, this);
////         Todos.bind('all',   this.render, this);
//
//
//
//         this.render();
//
//      },
//
//      render: function(){
//         $(this.el).append("<ul> <li>hello world</li> </ul>");
//
//         var view = new ScenarioView({model: scenario});
//         this.$("#scenario_nav").append(view.render().el);
//      }
//
//
//
//   });
//
//   var App = new AppView;



});