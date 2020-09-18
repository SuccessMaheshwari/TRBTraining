module User::Operation
  class Index < Trailblazer::Operation
    step :load_data

    def load_data(ctx, **)
      ctx[:users] = User.all
    end

  end
end