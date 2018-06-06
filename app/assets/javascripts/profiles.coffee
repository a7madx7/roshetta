# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#profile_profession').on('change', ->
    $this = $(this)
    # console.log($this.val())
    specialities = {
      "Dentist": ['Prothodontist', 'Implantologist', 'Orthodontist', 
        'Periodontist', 'Pedodontist', 'Endodontist',
        'Oral and maxilofacial surgeon', 'Dental Cosmotologist'],
      "Pharmacist": ['Anticoagulation', 'Cardiology',
        'Compounding', 'Critical care', 'Emergency Medicine',
        'Geriatrics', 'HIV-AIDS', 'None', 'Nuclear medicine', 
        'Nutrition support', 'Oncology', 'Pain management', 'Pharmacotherapy',
        'Psychiatry-mental health', 'Veterinary Medicine' ],
      "Physician": ['Allergy & Clinical Immunology', 'Anesthesiology', 
        'Cardiology-Echocardiology', 'Cardiology-Electrophysiology',
        'Cardiology general', 'Cardiology interventional', 'Cardiology nuclear',
        'Critical care', 'Intensive care', 'Dermatology general', 'Dermatology cosmetics',
        'Diabetes', 'Diabetes Educator', 'Emergency Medicine', 'Endocrinology metabolism',
        'Endocrinology reproductive-infertility', 'Family medicine', 'Gastroenterology',
        'General practice', 'Genomic medicine', 'Geriatrics', 'Hematology', 'Hepatology',
        'HIV-AIDS', 'Hospice-Palliative care', 'Hopspital medicine', 'Infectious diseases',
        'Internal medicine', 'Neonatal-perinatal medicine', 'Nephrology', 'Neurology', 'Neurosurgery',
        'Nuclear medicine', 'Nutrition', 'Ob/Gyn & Women health', 'Oncology hematology/oncology',
        'Oncology medical', 'Oncology other', 'Oncology radiation', 'Ophthalmology',
        'Orthopaedic surgery', 'Otolaryngology', 'Pain management', 'Pain management',
        'Paediatrics, Allergy', 'Paediatrics, Cardiology', 'Paediatrics, General', 'Paediatric, Oncology',
        'Physical medicine & Rehabilitation', 'Plastic surgery & Aesthetic medicine',
        'Preventive medicine', 'Psychiatry-mental health', 'Public-community health',
        'Pulmonary medicine', 'Radiology', 'Radiology, Interventional', 'Rheumatology',
        'Surgery, cardiothoracic', 'Surgery general', 'Surgery oral & maxillofacial', 'Surgery other',
        'Surgery, surgical oncology', 'Surgery vascular', 'Transplantation', 'Urology', 'Vascular medicine',
        'Other clinical', 'Non clinical'],
      "Merchant-Company": ['Middle East', 'Global', 'Africa', 'Asia',
      'Europe', 'North America', 'South America', 'Other'],
      "None": ["None"]
    }
    $speciality = $('#profile_speciality')
    selectedOption = $this.val()
    
    createDropdown = (selectedOption) ->
      $speciality.html ''
      $.map specialities, (val, key) ->
        if key == selectedOption
          $.map val, (item, index) ->
            $speciality.append $('<option>').attr('value', item).text(item)
            return
        return
      return

    createDropdown selectedOption

  )