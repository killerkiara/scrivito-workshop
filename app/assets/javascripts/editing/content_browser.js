jQuery(function() {
	scrivito.on('load', function() {
		scrivito.register_default_obj_class_for_content_type({
			'image/*': 'Image',
			'*/*': 'MyDownload'

		});

		scrivito.content_browser.filters = function(filter_context) {
      if(filter_context.blog_link) {
        return {
          _obj_class: {
            field: '_obj_class',
            options: {
              BlogPost: {
                icon: 'page',
              },
              Download: {
                icon: 'generic'
              }
            }
          }
        };
      } else if (filter_context.person) {
          return {
          _obj_class: {
            field: '_obj_class',
            options: {
              Person: {
                icon: 'user',
                enable_create: true, 
                preset: {
                  _obj_class: 'Person'
                }
              }
            }
          }
        };  
      } else {
  			return {
  				_obj_class: {
    				field: '_obj_class',
    				options: {
    					Image: {
    						expanded: true,
    						icon: 'image',
    						field: 'features',
    						options: {
    							paid: {
    								preset: {
    									features: ['paid']
    								}
    							},
    							free: {
    							}
    						}
    					},
    					Blog: {
    						icon: 'page',
    						enable_create: true,
    						preset: {
    							_obj_class: 'Blog'
    						}
    					},
    					Downloads: {
    						icon: 'generic'
    					}
    				}
  				}
  			};
      };
		};
	});
});