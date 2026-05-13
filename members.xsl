<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>RRJ FARM - Cooperative Members</title>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
                <style>
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body { font-family: 'Inter', sans-serif; background: #f0f4e8; padding: 2rem; }
                    .members-container { max-width: 1400px; margin: 0 auto; }
                    .members-header { text-align: center; margin-bottom: 2rem; }
                    .members-header h2 { font-size: 2rem; color: #1a4d1a; margin-bottom: 0.5rem; }
                    .members-header h2 i { color: #2d6a2d; margin-right: 0.5rem; }
                    .members-header p { color: #4a5b4a; font-size: 1rem; }
                    .member-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(380px, 1fr)); gap: 1.5rem; }
                    .member-card { background: white; border-radius: 24px; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.08); transition: transform 0.3s, box-shadow 0.3s; position: relative; }
                    .member-card:hover { transform: translateY(-5px); box-shadow: 0 12px 30px rgba(0,0,0,0.15); }
                    .member-badge { position: absolute; top: 15px; right: 15px; z-index: 10; }
                    .badge-active { background: #d4edda; color: #155724; padding: 0.2rem 0.8rem; border-radius: 30px; font-size: 0.7rem; font-weight: 600; }
                    .badge-inactive { background: #f8d7da; color: #721c24; padding: 0.2rem 0.8rem; border-radius: 30px; font-size: 0.7rem; font-weight: 600; }
                    .member-avatar { font-size: 4rem; text-align: center; padding: 1.5rem 0 0.5rem; background: linear-gradient(135deg, #e8f0e8, #d4e4d4); }
                    .member-info { padding: 1.2rem; }
                    .member-name { font-size: 1.2rem; font-weight: 700; color: #1a2e1a; margin-bottom: 0.3rem; }
                    .member-location { font-size: 0.8rem; color: #2d6a2d; margin-bottom: 0.5rem; }
                    .member-location i { margin-right: 0.3rem; }
                    .member-farm-type { font-size: 0.85rem; color: #ff8c00; font-weight: 600; margin-bottom: 0.8rem; }
                    .member-farm-type i { margin-right: 0.3rem; }
                    .member-details { display: flex; flex-wrap: wrap; gap: 0.8rem; margin: 0.8rem 0; padding: 0.5rem 0; border-top: 1px solid #e8f0e8; border-bottom: 1px solid #e8f0e8; }
                    .detail-item { display: flex; align-items: center; gap: 0.3rem; font-size: 0.75rem; color: #4a5b4a; }
                    .detail-icon { font-size: 0.9rem; }
                    .member-bio { font-size: 0.8rem; color: #4a5b4a; line-height: 1.4; margin: 0.8rem 0; font-style: italic; }
                    .member-bio i { color: #2d6a2d; margin-right: 0.3rem; }
                    .member-contact { display: flex; flex-direction: column; gap: 0.3rem; margin: 0.8rem 0; font-size: 0.7rem; color: #666; }
                    .member-contact span { display: flex; align-items: center; gap: 0.5rem; }
                    .member-contact i { width: 16px; color: #2d6a2d; }
                    .btn-chat-member { background: linear-gradient(135deg, #2d6a2d, #1a4d1a); color: white; border: none; padding: 0.6rem 1rem; border-radius: 40px; cursor: pointer; font-weight: 600; font-size: 0.8rem; width: 100%; transition: all 0.3s; margin-top: 0.5rem; }
                    .btn-chat-member:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(45,106,45,0.3); }
                    .btn-chat-member i { margin-right: 0.5rem; }
                    @media (max-width: 768px) { .member-grid { grid-template-columns: 1fr; } body { padding: 1rem; } }
                </style>
            </head>
            <body>
                <div class="members-container">
                    <div class="members-header">
                        <h2><i class="fas fa-users"></i> Our Cooperative Members</h2>
                        <p>Meet the dedicated farmers and homesteaders of RRJ FARM</p>
                    </div>
                    <div class="member-grid">
                        <xsl:for-each select="rrj_farm/members/member">
                            <div class="member-card">
                                <div class="member-badge">
                                    <xsl:choose>
                                        <xsl:when test="status = 'Active'">
                                            <span class="badge-active">● Active Member</span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <span class="badge-inactive">○ Inactive</span>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </div>
                                <div class="member-avatar">
                                    <xsl:value-of select="avatar"/>
                                </div>
                                <div class="member-info">
                                    <h3 class="member-name">
                                        <xsl:value-of select="name"/>
                                    </h3>
                                    <p class="member-location">
                                        <i class="fas fa-map-marker-alt"></i> 
                                        <xsl:value-of select="location"/>
                                    </p>
                                    <p class="member-farm-type">
                                        <i class="fas fa-seedling"></i> 
                                        <xsl:value-of select="farm_type"/>
                                    </p>
                                    <div class="member-details">
                                        <div class="detail-item">
                                            <span class="detail-icon">📏</span>
                                            <span class="detail-text">
                                                <xsl:value-of select="lot_size"/> hectares
                                            </span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-icon">💰</span>
                                            <span class="detail-text">
                                                ₱<xsl:value-of select="monthly_fee"/>/month
                                            </span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-icon">📅</span>
                                            <span class="detail-text">
                                                Joined <xsl:value-of select="join_date"/>
                                            </span>
                                        </div>
                                    </div>
                                    <p class="member-bio">
                                        <i class="fas fa-quote-left"></i> 
                                        <xsl:value-of select="bio"/>
                                    </p>
                                    <div class="member-contact">
                                        <span class="contact-email">
                                            <i class="fas fa-envelope"></i> 
                                            <xsl:value-of select="email"/>
                                        </span>
                                        <span class="contact-phone">
                                            <i class="fas fa-phone"></i> 
                                            <xsl:value-of select="phone"/>
                                        </span>
                                    </div>
                                    <button class="btn-chat-member" onclick="openChat('{name}', '{avatar}')">
                                        <i class="fas fa-comment-dots"></i> Chat with <xsl:value-of select="name"/>
                                    </button>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
                <script>
                    function openChat(name, avatar) {
                        alert('Chat feature: Start chatting with ' + name);
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
