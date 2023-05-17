USE urgentNews;

CREATE TABLE News (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  content TEXT,
  published_at DATETIME
);

INSERT INTO News (title, content, published_at)
  VALUES
  ('Breaking: Global Cyberattack Targets Major Financial Institutions', 'A massive cyberattack has targeted major financial institutions worldwide, resulting in widespread disruption and security breaches. Authorities are investigating the incident and urging caution in online transactions.', '2022-05-15 14:06:16'),
  ('Urgent: Massive Earthquake Strikes Pacific Ring of Fire', 'A powerful earthquake with a magnitude of 7.8 has struck the Pacific Ring of Fire, causing extensive damage to several coastal regions. Rescue and relief efforts are underway.', '2023-04-11 15:14:01'),
  ('Emergency Alert: Deadly Outbreak of New Viral Strain Detected', 'Health officials have identified a new and highly contagious viral strain responsible for a deadly outbreak. Urgent measures are being taken to contain the spread and develop effective treatments.', '2023-08-05 12:06:13'),
  ('Breaking News: Terrorist Attack Rocks Capital City', 'A devastating terrorist attack has shaken the capital city, causing multiple casualties and widespread panic. Security forces are on high alert and conducting investigations.', '2023-05-15 14:06:16'),
  ('Urgent: Record-Breaking Heatwave Threatens Public Health', 'An unprecedented heatwave is gripping the region, with temperatures reaching dangerous levels. Public health advisories have been issued, urging residents to stay hydrated and seek shelter.', '2020-05-15 14:06:16'),
  ('Emergency Broadcast: Nuclear Plant Leak Prompts Evacuation', 'A leak has been detected at a nearby nuclear power plant, leading to the immediate evacuation of surrounding areas. Emergency response teams are working to mitigate the situation.', '2023-12-14 09:06:16'),
  ('Breaking: International Space Station Suffers Critical Systems Failure', 'The International Space Station (ISS) has experienced a critical systems failure, endangering the lives of astronauts onboard. Engineers are working to restore functionality and ensure their safe return.', '2023-01-11 06:06:00'),
  ('Urgent Update: World Leaders Summit Canceled Due to Security Threat', 'Due to a credible security threat, the highly anticipated world leaders summit has been canceled. Security agencies are investigating the threat and implementing heightened security measures.', '2022-07-17 11:08:16'),
  ('Emergency Advisory: Category 5 Hurricane Approaching Coastal Regions', 'A Category 5 hurricane is rapidly approaching coastal regions, posing a severe threat to life and property. Evacuation orders have been issued, and emergency response teams are mobilizing.', '2023-6-10 12:06:16'),
  ('Breaking News: Major Airline Grounds Fleet Amidst Safety Concerns', 'A major airline has made the decision to ground its entire fleet following safety concerns. Passengers are advised to check for updates and make alternative travel arrangements.', '2023-05-15 14:10:16'),
  ('Urgent Alert: Stock Market Plunges, Global Economic Crisis Looms', 'The stock market has experienced a significant plunge, signaling a potential global economic crisis. Financial experts are closely monitoring the situation for further impact.', '2023-05-15 15:06:16'),
  ('Emergency Broadcast: Deadly Wildfires Ravage Multiple States', 'Multiple states are facing devastating wildfires, resulting in the loss of homes and natural habitats. Firefighters are battling to contain the fires, and residents are urged to follow evacuation orders.', '2023-05-15 14:06:16'),
  ('Breaking: Political Scandal Shakes Government, Calls for Resignation', 'A high-profile political scandal has rocked the government, leading to widespread calls for resignations and investigations. Public trust in the administration has been severely affected.', '2023-05-19 14:06:16'),
  ('Urgent Update: New Highly Contagious Variant Spreads Rapidly', 'Health officials have identified a new highly contagious variant of a virus, leading to a rapid increase in infections. Vaccination efforts are being accelerated, and precautionary measures are being advised.', '2023-05-16 12:06:16'),
  ('Emergency Advisory: Chemical Spill Contaminates Water Supply', 'A significant chemical spill has contaminated the local water supply, posing a severe health risk. Authorities are working to contain the spill and provide alternative water sources to affected areas.', '2023-04-11 09:06:16'),
  ('Breaking News: Terrorist Plot Foiled, Public Remain Vigilant', 'Security forces have successfully foiled a major terrorist plot, averting a potential catastrophe. However, the public is urged to remain vigilant and report any suspicious activities.', '2023-03-19 02:06:16'),
  ('Urgent: International Cybersecurity Breach Exposes Sensitive Data', 'A widespread cybersecurity breach has exposed sensitive data of individuals and organizations. Cybersecurity experts are working to mitigate the breach and prevent further damage.', '2023-08-03 06:06:00'),
  ('Emergency Broadcast: Volcanic Eruption Threatens Island Communities', 'A volcanic eruption is threatening several island communities, triggering evacuations and posing risks to residents. Volcanologists are closely monitoring the situation for further volcanic activity.', '2023-05-19 09:16:00'),
  ('Breaking: Major Oil Spill Devastates Marine Ecosystem', 'A major oil spill has occurred, causing significant damage to the marine ecosystem and local wildlife. Cleanup efforts are underway, but the long-term impact remains a concern.', '2023-04-15 07:06:16'),
  ('Urgent Alert: Widespread Power Outages Paralyze City Infrastructure', 'Widespread power outages have paralyzed the citys infrastructure, causing disruptions to transportation, communications, and essential services. Utility crews are working around the clock to restore power.', '2021-01-01 01:06:09');