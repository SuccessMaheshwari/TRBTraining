module User::Operation
  class Create < Trailblazer::Operation  

    step ->(ctx, **) { ctx[:params][:email].length > 0 }
    fail ->(ctx, **) { ctx[:error] = "email can't be blanck"}, fail_fast: true
    step ->(ctx, **) { ctx[:params][:password].present? && ctx[:params][:password] == ctx [:params][:password_confirmation] }
    fail ->(ctx, **) { ctx[:error] = "passwords invalid"}, fail_fast: true
    step :create_user

    def create_user(ctx, **)
        ctx[:message] = "User is created successfully"
    end

  end
end