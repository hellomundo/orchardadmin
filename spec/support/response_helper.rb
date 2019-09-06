module ResponseHelper
    def parse_json(content)
        parsed = JSON.parse(content) rescue {}
        return parsed
    end
end
