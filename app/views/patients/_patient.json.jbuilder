json.extract! patient, :id, :name, :social_security_id, :rx_id, :last_dispense_ip, :created_at, :updated_at
json.url patient_url(patient, format: :json)
