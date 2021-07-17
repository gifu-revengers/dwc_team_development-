Rails.application.routes.draw do
  
  scope module: 'public' do

    root 'homes#top'
    get  'about',   to: 'homes#about'

    resource  :customers,     only:[:show,:edit,:update] do
        get   'quit_confirm', on: :collection
        patch 'quit',         on: :collection
    end

    resources :shipping_addresses, except:[:new,:show]
    resources :items,              only:[:index,:show]

    resources :cart_items, except:[:new,:edit,:show] do
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
    resources  :customers,   except:[:new,:destroy,:create]
    resources  :genres,      except:[:new,:destroy,:show]
    resources  :items,       except:[:destroy]
    resources  :orders,      only:[:index,:show,:update]
    resources  :order_lists, only:[:update]
  end

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
end
