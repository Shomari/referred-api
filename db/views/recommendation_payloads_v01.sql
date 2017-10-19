SELECT
users.name as user_name,
users.image_location as user_image,
recommendations.text as text,
recommendations.updated_at,
recommendations.status,
businesses.id as business_id
FROM recommendations
JOIN users ON recommendations.user_id = users.id
JOIN businesses ON recommendations.business_id = businesses.id
