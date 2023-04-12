package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.IngredientVO;
import org.zerock.domain.RecipeVO;
import org.zerock.domain.StepVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RecipeMapperTests {
	
	@Autowired
	private RecipeMapper mapper;
	
	@Test
	public void testGetRecipeList() {
		mapper.getRecipeList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGetStepList() {
		mapper.getStepList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testGetIngreList() {
		mapper.getIngreList().forEach(board-> log.info(board));
	}
	
	@Test
	public void testRecipeRead() {
		RecipeVO board = mapper.readRecipe(195454L); //나물비빔밥 나오면 정상
		log.info(board);
	}
	
	
	@Test
	public void testStepRead() {
		List<StepVO> board = mapper.readStep(1L);
		log.info(board);
	
	}
	
	@Test
	public void testIngredientRead() {
		List<IngredientVO> board = mapper.readIngredient(1L);
		log.info(board);
	}
	
	
	@Test
	public void testInsertRecipe() {
		RecipeVO board = new RecipeVO();
		board.setId("user1");
		board.setRecipeName("후라이계란");
		board.setRecipeDescription("이것은 간단한 요리입니다.");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("한식");
		board.setTime("3분");
		board.setPerson("1인분");
		board.setDifficulty("초보");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		mapper.insertRecipe(board);
		log.info(board);
	}
	
	@Test
	public void testInsertStep() {
		StepVO board = new StepVO();
		board.setBno(195454L);
		board.setStepNo(1L);
		board.setStepDescription("계란을 깬다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("잘");
		
		mapper.insertStep(board);
		log.info(board);
	}
	
	@Test
	public void testInsertIngredient() {
		IngredientVO board = new IngredientVO();
		board.setIno(500000L);
		board.setBno(195454L);
		board.setIngreName("계란");
		board.setIngreMeasure("약간");
		board.setIngreTypeNo(3060001L);
		board.setIngreType("주재료");
		
		mapper.insertIngredient(board);
		log.info(board);
	}
	
	@Test
	public void testStepDelete() {
		log.info("DELETE COUNT : " + mapper.deleteStep(195454L));
	}
	
	@Test
	public void testIngredientDelete() {
		log.info("DELETE COUNT : " + mapper.deleteIngredient(195454L));
	}
	
	@Test
	public void testRecipeDelete() {
		log.info("DELETE COUNT : " + mapper.deleteRecipe(195454L));
	}
	
	@Test
	public void testUpdateRecipe() {
		RecipeVO board = new RecipeVO();
		board.setBno(195454L);
		board.setId("user1");
		board.setRecipeName("후라이계란이");
		board.setRecipeDescription("이것은 간단한 요리입니다!");
		board.setFoodTypeNo(3020001L);
		board.setFoodType("한식");
		board.setTime("3분");
		board.setPerson("1인분");
		board.setDifficulty("초보");
		board.setImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		
		int count = mapper.updateRecipe(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateStep() {
		StepVO board = new StepVO();
		board.setSno(3023L);
		board.setBno(195454L);
		board.setStepNo(1L);
		board.setStepDescription("소금을 넣는다.");
		board.setStepImage("http://file.okdab.com/UserFiles/searching/recipe/173600.jpg");
		board.setTip("잘잘");
		
		int count = mapper.updateStep(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testUpdateIngredient() {
		IngredientVO board = new IngredientVO();
		board.setIno(5000000L);
		board.setBno(195454L);
		board.setIngreName("소금");
		board.setIngreMeasure("약간");
		board.setIngreTypeNo(3060003L);
		board.setIngreType("양념");
		
		int count = mapper.updateIngredient(board);
		log.info("UPDATE COUNT : " + count);
	}
	

}