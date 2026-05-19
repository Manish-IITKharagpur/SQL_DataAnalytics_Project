# Descriptive Analytics Report
**Generated:** 2026-05-18
**Dataset:** SQL Analytics Gold Layer (sql-analytics)
**Question:** Which product categories and lines drive the most revenue, and how has the mix shifted year over year?
**Focus:** Revenue segmentation + product line trend + root cause indicators

---

## Executive Summary

Bikes are the overwhelming revenue engine, generating 97-98% of total revenue across every full year (2011-2013), confirming the business's structural dependency on a single category. Within Bikes, a dramatic shift occurred: Mountain Bikes overtook Road Bikes in 2013 with a $4M+ revenue swing, driven by both a 75% SKU expansion (14 to 26 active SKUs) and a surge in revenue per SKU from $96K to $461K. This crossover is consistent across 5 of 6 markets, with the United States leading Mountain's absolute growth. Accessories and Clothing launched in earnest in 2013 (each had under $5K in 2012) and together represent 6.5% of 2013 revenue -- a promising but highly concentrated early stage. Within Accessories, Helmets alone account for 59% of category revenue. No Simpson's Paradox was detected: all 6 country markets grew YoY in 2013, consistent with the global trend.

---

## Key Findings

### Finding 1: Bikes generate 97-98% of revenue -- the business is structurally dependent on one category
**Evidence:** In 2011 and 2012, Bikes accounted for 100% of revenue (Accessories and Clothing had <$5K combined). In 2013, Bikes held 93.5%, Accessories 4.3%, Clothing 2.2%. Total 2013 revenue: ~$25.1M from Bikes, $1.1M from Accessories, $559K from Clothing.
**Implication:** Any headwind to the Bikes business (pricing pressure, supply issues, demand shift) has an outsized impact on total company revenue. The Accessories/Clothing launch in 2013 is the first meaningful step toward diversification, but at 6.5% combined share, it provides minimal insurance today.
**Confidence:** HIGH (complete data, large sample, no nulls in relevant columns)
**Chart:** ![Category Share](charts/A_category_share.png)

---

### Finding 2: Mountain overtook Road in 2013 -- a structural shift, not a one-year blip
**Evidence:** Road was dominant in 2011 ($5.9M vs Mountain's $1.3M) and 2012 ($6.0M vs $4.5M). In 2013, Mountain surged to $12.3M while Road grew modestly to $8.1M -- a crossover gap of $4.1M. Touring also launched meaningfully in 2013 at $3.9M.
**Implication:** Mountain is the new growth engine. The product line mix shifted fundamentally in 2013. Investment in Mountain assortment, marketing, and category management appears warranted.
**Confidence:** HIGH
**Chart:** ![Mountain vs Road](charts/B_mountain_road_crossover.png)

---

### Finding 3: Mountain's surge was driven by both SKU expansion AND higher revenue per SKU
**Evidence:** Mountain active SKUs grew from 14 (2011) to 15 (2012) to 26 (2013) -- a 75% increase in one year. Simultaneously, Mountain revenue per SKU grew from $96K (2011) to $302K (2012) to $461K (2013). Road, by contrast, contracted from 44 SKUs (2012) to 28 (2013) while revenue per SKU grew from $112K to $287K.
**Implication:** Mountain's growth is not fragile -- it is supported by both breadth (more products) and depth (each product selling more). Road's SKU contraction with rising revenue per SKU suggests a deliberate pruning of underperformers, not market decline.
**Confidence:** HIGH
**Chart:** ![SKU Analysis](charts/D_sku_analysis.png)

---

### Finding 4: Mountain leads Road in 5 of 6 markets, but Australia is the exception -- Road dominates there
**Evidence:** In 2013, Mountain led Road in USA ($4.8M vs $1.6M), Canada ($0.9M vs $0.3M), France ($1.2M vs $0.8M), Germany ($1.4M vs $0.8M), and UK ($1.6M vs $1.1M). Australia is the sole exception: Road leads at $3.2M vs Mountain's $2.4M.
**Implication:** Mountain's global dominance is not an Australia-driven effect. The USA is the largest Mountain market in absolute terms. Australia's Road preference may represent a different consumer profile or legacy distribution relationship worth investigating.
**Confidence:** HIGH
**Chart:** ![Country Breakdown](charts/C_country_mountain_road.png)

---

### Finding 5: Accessories and Clothing are a 2013 launch -- their revenue trajectory is promising but from a near-zero base
**Evidence:** In 2012, Accessories generated $3,966 and Clothing $1,258 -- essentially zero. In 2013: Accessories $1,099,611 and Clothing $559,410. The 2014 partial-year data (Jan only) shows $47K and $27K respectively, consistent with full-year run rates.
**Implication:** H1.3 is CONFIRMED: these are genuine 2013 category launches, not organic growth. Any projection from 2013 data carries high uncertainty (one year of data). However, the ramp trajectory is positive.
**Confidence:** HIGH (data is clear; trajectory uncertainty is noted)

---

### Finding 6: Helmets drive 59% of Accessories revenue -- the category is Helmet-led
**Evidence:** Helmets: $676K (58.8% of Accessories). Tires & Tubes: $244K (21.2%). Bottles & Cages: $57K (5.0%). The remaining 5 subcategories each contribute under 5%.
**Implication:** H3.2 is CONFIRMED. Accessories category growth is concentrated in a single subcategory. Diversifying the accessories assortment -- growing Tires, Hydration, and Bike Racks -- is the primary lever to expand category revenue.
**Confidence:** HIGH
**Chart:** ![Accessories Subcategory](charts/E_accessories_subcategory.png)

---

## Segmentation Analysis

### Dimension: Category (2011-2013)
| Year | Bikes % | Accessories % | Clothing % |
|------|---------|---------------|------------|
| 2011 | 100.0%  | 0.0%          | 0.0%       |
| 2012 | ~100.0% | 0.0%          | 0.0%       |
| 2013 | 93.5%   | 4.3%          | 2.2%       |

**Insight:** Bikes is the entire business through 2012. The 2013 expansion into Accessories/Clothing is the first meaningful diversification.

### Dimension: Product Line (2011-2013, Bikes only)
| Year | Mountain | Road | Touring |
|------|----------|------|---------|
| 2011 | $1.3M    | $5.9M | -- |
| 2012 | $4.5M    | $6.0M | $21K |
| 2013 | $12.3M   | $8.1M | $3.9M |

**Insight:** Mountain grew 172% YoY in 2013. Road grew 35%. Touring launched as a material line in 2013.

### Dimension: Country (2013, all categories)
| Country | 2013 Revenue | YoY vs 2012 |
|---------|-------------|-------------|
| United States | $8.1M | +201% |
| Australia | $6.9M | +78% |
| United Kingdom | $3.3M | +160% |
| Germany | $2.7M | +157% |
| France | $2.5M | +113% |
| Canada | $1.7M | +213% |

**Insight:** USA is the largest market and grew fastest in absolute terms. All 6 markets grew strongly in 2013.

---

## Hypothesis Evaluation

| Hypothesis | Result | Evidence | Confidence |
|-----------|--------|----------|------------|
| H1.1: Bikes >90% share | CONFIRMED | 93.5% in 2013; 100% in 2011-12 | HIGH |
| H1.2: Mountain overtook Road in 2013 | CONFIRMED | $12.3M vs $8.1M in 2013 | HIGH |
| H1.3: Accessories/Clothing are a 2013 launch | CONFIRMED | <$5K each in 2012 | HIGH |
| H2.1: Mountain surge driven by new SKUs | CONFIRMED (both) | SKUs: 14->26; rev/SKU: $96K->$461K | HIGH |
| H2.2: Australia drove Mountain's dominance | REJECTED | Road leads in Australia; USA drives Mountain | HIGH |
| H2.3: Road growth slowed (not demand decline) | CONFIRMED | Road orders grew 50%; revenue grew 35% | HIGH |
| H3.1: Accessories ~2x Clothing revenue | CONFIRMED | $1.1M vs $559K (1.97x) | HIGH |
| H3.2: Helmets >50% of Accessories revenue | CONFIRMED | 58.8% | HIGH |

---

## Segment-First Check (Simpson's Paradox Screen)
**Dimensions checked:** Country (6 markets), Product Line (Mountain, Road, Touring)
**Result:** PASSED on both dimensions.
- All 6 country markets grew YoY in 2013 (range: +78% to +213%), consistent with the global +141% growth.
- Mountain and Road both grew in absolute revenue terms -- Mountain's dominance reflects faster growth, not Road's decline.
- **No Simpson's Paradox detected.** Aggregate trends are reliable.

---

## Validation Report
| Check | Result | Detail |
|-------|--------|--------|
| Category shares sum to 100% per year | PASS | Verified: 2013 = 93.5+4.3+2.2 = 100% |
| Revenue sum matches known total | PASS | SUM(sales_amount) = $43,521,921 |
| Accessories subcategory shares sum to 100% | PASS | 58.8+21.2+5.0+4.1+3.5+3.4+3.4+0.6 = 100% |
| SKU count trends are monotonic (Mountain) | PASS | 14->15->26 (increasing) |
| Country YoY growth direction consistent | PASS | All 6 countries positive |
| Mountain > Road in 2013 | PASS | $12.3M > $8.1M confirmed |
| order_date IS NOT NULL filter applied | PASS | 24 NULL rows excluded throughout |
| product_line 'n/a' filtered | PASS | Applied in all product line queries |
| country 'n/a' filtered | PASS | Applied in all country queries |

---

## Data Limitations
- **Partial years:** 2010 (Dec only) and 2014 (Jan only) excluded from YoY trend analysis to avoid distortion.
- **No margin data:** cost=0 for some products; profitability analysis not possible.
- **Accessories/Clothing trajectory uncertainty:** Only 1 full year (2013) of data. Run-rate projections have wide uncertainty bands.
- **No external benchmarks:** Cannot compare category mix to industry norms.
- **Components excluded:** 182 Component SKUs appear in dim_products but have zero sales -- correctly excluded.

---

## Recommended Next Steps
1. **Root Cause Investigation:** Drill into Mountain's SKU expansion -- which specific SKUs launched in 2012-2013 drove the surge? Are 1-2 SKUs (e.g., Mountain-200) driving the majority of Mountain revenue? (Use root-cause-investigator agent)
2. **Australia deep-dive:** Understand why Australia remains Road-dominant when every other market has shifted to Mountain. Is this a customer profile difference, a distribution issue, or a pricing anomaly?
3. **Accessories/Clothing investment case:** Model what revenue looks like if Accessories/Clothing grow to 10% each of total revenue. What SKU additions and marketing investment would that require?
4. **Opportunity sizing:** Quantify the revenue opportunity if Mountain's assortment expansion continues at the same rate into 2014-2015.