# SlimBreadcrumb

This is a **ruby on rails gem** to **slim out** certain elements of a **breadcrumb navigation** and show these elements only if the user's mouse dwells on the breadcrumb separator.

## Demo

You might want to have a look at [this demo app at heroku](http://slim-breadcrumb-test-app.herokuapp.com/).

The [code of this demo app can be found here](https://github.com/fiedl/slim_breadcrumb/tree/master/test_app).

## Installation

Add this line to your application's Gemfile:

    gem 'slim_breadcrumb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install slim_breadcrumb

### Include Assets

In `app/assets/javascripts/application.js`, add:

```javascript
//= require slim_breadcrumb
```
## Usage

In order to use this gem, you may use any tool of convenience to create your breadcrumb html code. The produced html code should look something like this:

```html
<nav>
  <div id="breadcrumb">
    <ul>
	  <li class="first crumb"><a href="#">#0 (Root)</a></li>
	  <li class="crumb sep">&nbsp;</li>
			  
	  <li class="slim crumb"><a href="#">#1 (Slim Crumb)</a></li>
	  <li class="crumb sep">&nbsp;</li>
				  
	  <li class="slim crumb"><a href="#">#2 (Slim Crumb)</a></li>
	  <li class="crumb sep">&nbsp;</li>
							  
	  <li class="crumb"><a href="#">#3 (Normal Crumb)</a></li>
	  <li class="crumb sep">&nbsp;</li>
									  
	  <li class="slim crumb"><a href="#">#4 (Slim Crumb)</a></li>
	  <li class="crumb sep">&nbsp;</li>
													  
	  <li class="slim last crumb"><a href="#">#5 (Slim Crumb)</a></li>
    </ul>
  </div>
</nav>
```

The important parts of this example are the **css classes** and the **id `#breadcrumb`**, the script relies on.

If you'd like to have a look at the [script, which is rather simple, you can do this here](https://github.com/fiedl/slim_breadcrumb/blob/master/lib/assets/javascripts/slim_breadcrumb.js.coffee).

You also have to handle your **stylesheets** for the breadcrumb yourself. An [example stylesheet can be found here](https://github.com/fiedl/slim_breadcrumb/blob/master/test_app/app/assets/stylesheets/breadcrumb.css.sass). Note that you may use the breadcrumb separator image just as done in the example, since this gem is providing this image.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
