SELECT
  referrals.referrer_id as referrer_id,
  referrals.referred_id as referred_id,
  referrer.name as referrer_name,
  referrer.image_location as referrer_image,
  referrer.email as referrer_email,
  referred.name as referred_name,
  referred.image_location as referred_location,
  referred.email as referred_email,
  referred.phone as referred_phone,
  businesses.id as business_id
FROM referrals
JOIN users referrer ON referrals.referrer_id = referrer.id
JOIN users referred ON referrals.referred_id = referred.id
JOIN businesses ON referrals.business_id = businesses.id
