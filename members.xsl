<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
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
    </xsl:template>
</xsl:stylesheet>