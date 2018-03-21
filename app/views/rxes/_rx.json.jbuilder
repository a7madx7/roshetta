json.extract! rx, :id, :expires_at, :total_value, :dispensed_count, :patient_id, :dispenser_id, :issuer_id, :short_diagnosis, :full_diagnosis, :allowed_dispense_count, :status, :visibility, :picture, :expired, :professional_comment, :starts_at, :created_at, :updated_at
json.url rx_url(rx, format: :json)
