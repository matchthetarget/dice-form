Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "render_homepage" })

  get("/process_roll", { :controller => "application", :action => "dice_roll" })
end
