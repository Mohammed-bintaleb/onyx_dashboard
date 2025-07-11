final List<Map<String, dynamic>> customerFormFields = [
  {
    'name': 'customer_name',
    'label': 'Customer Name',
    'initial': 'John Doe',
    'required': true,
  },
  {
    'name': 'customer_email',
    'label': 'Customer Email',
    'initial': 'john.doe@example.com',
    'required': true,
  },
  {
    'name': 'phone',
    'label': 'Phone Number (Optional)',
    'initial': '123456-7890',
    'required': false,
  },
  {
    'name': 'address',
    'label': 'Shipping Address',
    'initial': '123 Main St',
    'required': true,
  },
  {'name': 'city', 'label': 'City', 'initial': 'Anytown', 'required': true},
  {'name': 'state', 'label': 'State', 'initial': 'CA', 'required': true},
  {'name': 'zip', 'label': 'ZIP Code', 'initial': '12345', 'required': true},
];
