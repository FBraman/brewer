<div class="row">
    <div class="small-6 large-6 columns">
      <div class="panel">


        
        <div> 
        <ul>
          <div id="recipe_show_headings">
            Yeast: 
          </div>
          
          <% @recipe.ingredients.each do |ingredient| %>
          <div>
            <li>
              <% if ingredient.component.version.include? "yeast" %>
                  <%= ingredient.amount  %>  pkg. 
                  <%= link_to ingredient.component.name, component_path(ingredient.component) %>
                <% end %>

            <div id="recipe_show_headings">
              Fermentables: 
            </div>


            <% elsif ingredient.component.version.include? "fermentable" %>
                <%= ingredient.amount  %>  lbs. 
                <%= link_to ingredient.component.name, component_path(ingredient.component) %>
            <% end %>

            <div id="recipe_show_headings">
              Hops: 
            </div>

            <% elsif ingredient.component.version.include? "hops" %>
              <%= ingredient.amount  %>  oz. 
              <%= link_to ingredient.component.name, component_path(ingredient.component) %>
              <%= ingredient.component.aa %> %AA
              <%= ingredient.boil_time %>.min boil  
            <% end %>
          <% end %>
          </li>
        </div>
        </ul>
      </div>
    </div>
  </div>
</div>