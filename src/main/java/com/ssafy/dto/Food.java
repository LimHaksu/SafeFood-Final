package com.ssafy.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/** 식품 정보 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Food {
	/**식품을 구별하는 코드 */
	private int code;
	/**식품 이름*/
	private String name;
	/**일회 제공 량*/
	private double supportpereat;
	/**일회 제공되는 칼로기*/
	private double calory;
	/**일회 제공되는 탄수화물*/
	private double carbo;
	/**일회 제공되는 단백질*/
	private double protein;
	/**일회 제공되는 지방*/
	private double fat;
	/**일회 제공되는 당류*/
	private double sugar;
	/**일회 제공되는 나트륨*/
	private double natrium;
	/**일회 제공되는 콜레스테롤*/
	private double chole;
	/**일회 제공되는 포화지방산*/
	private double fattyacid;
	/**일회 제공되는 트렌스지방*/
	private double transfat;
	/**제조사*/
	private String maker;
	/**원료*/
	private String material;
	/**이미지 경로*/
	private String img;
	private String allergy;
	
}
