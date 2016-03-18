json.array!(@hab_codes) do |hab_code|
  json.extract! hab_code, :id, :code, :last_name, :first_name, :email, :date_sent, :registered, :assigned, :completed, :debriefed, :report_sent, :coach_id
  json.url hab_code_url(hab_code, format: :json)
end
