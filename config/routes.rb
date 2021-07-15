Rails.application.routes.draw do

  scope module: 'public' do
    devise_for :customers

    root 'homes#top'
    get  'about',   to: 'homes/about'

    resource  :customers,     only:[:show,:edit,:update] do
        get   'quit_confirm', on: :collection
        patch 'quit',         on: :collection
    end

    resources :shipping_addresses, except:[:new,:show]
    resources :items,              only:[:index,:show]

    resources :carts_items, except:[:new,:edit,:show] do
      delete 'destroy_all', on: :collection
    end

    resources :orders, only:[:create,:index,:show] do
      collection do
        get  'information'
        get  'thankyou'
        post 'purchase'
      end
    end
  end

  namespace :admin do
    devise_for :admins
    resources  :customers,   except:[:new,:destroy,:create]
    resources  :genres,      except:[:new,:destroy,:show]
    resources  :items,       except:[:destroy]
    resources  :orders,      only:[:index,:show,:update]
    resources  :order_lists, only:[:update]
  end
end
