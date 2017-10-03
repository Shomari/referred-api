SELECT
  referrals.referrer_id as referrer_id,
  referrals.referred_id as referred_id,
  referrer.name as referrer_name,
  referrer.image_location as referrer_image,
  referred.name as referred_name,
  referred.image_location as referred_location,
  businesses.name as business_name,
  businesses.zipcode as business_zipcode
FROM referrals
JOIN users referrer ON referrals.referrer_id = referrer.id
JOIN users referred ON referrals.referred_id = referred.id
JOIN businesses ON referrals.business_id = businesses.id
