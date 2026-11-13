INSERT INTO pricing_plans (plan_type, price) VALUES
  ('Hourly',  20.00),
  ('Daily',   100.00),
  ('Monthly', 800.00);


INSERT INTO docks (station_id, bike_id, status) VALUES
  (1, 1,    'occupied'),
  (1, NULL, 'available'),
  (1, NULL, 'out_of_service'),
  (2, 2,    'occupied'),
  (2, NULL, 'available');