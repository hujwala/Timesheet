OmniAuth.config.logger = Rails.logger   
                Rails.application.config.middleware.use OmniAuth::Builder do
                 provider :linkedin, '78681f77ayutql', 'ckwL74oQQ4oL3H3y'  
               end
