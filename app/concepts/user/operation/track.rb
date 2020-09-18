module User::Operation
  class Track < Trailblazer::Operation
    step :getRecords
    step :isWebRequest?, Output(:failure) => Id(:order_desc)
    step :filterTime
    step :filterStatus
    step :setWebResponse, pass_fast: true

    step :order_desc
    step :setMobileResponse
  
    def getRecords(ctx, **)
      true
    end

    def isWebRequest?(ctx, **)
      ctx[:params][:req_src] == "Web"
    end

    def filterTime(ctx, **)
      ctx[:time] = "filtered"
    end

    def filterStatus(ctx, **)
      ctx[:status] = "filtered"
    end

    def setWebResponse(ctx, **)
      ctx[:msg] = {
        response: "Web Response"
      }
    end

    def order_desc(ctx, **)
      ctx[:order] = "descending"
    end

    def setMobileResponse(ctx, **)
      ctx[:msg] = {
        response: "Mobile Response"
      }
    end
  end
end