package com.tutorialspoint;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ProductServiceController {
	private static Map<String, Product> productRepo = new HashMap<>();

	static {
		Product honey = new Product();
		honey.setId("1");
		honey.setName("Honey");
		honey.setDescription("This is Honey Product which is sweet");
		productRepo.put(honey.getId(), honey);

		Product almond = new Product();
		almond.setId("2");
		almond.setName("Almond");
		almond.setDescription("This is Almond Product and it is in liqud form");
		productRepo.put(almond.getId(), almond);
	}

	@GetMapping("/productList")
	public ModelAndView getProductList() {
		ModelAndView mav = new ModelAndView();
		Collection<Product> listProd = productRepo.values();
		mav.addObject("productList", listProd);
		mav.setViewName("home");
		return mav;
	}

	@GetMapping("/addproduct")
	public ModelAndView addProduct() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("addProduct");
		return mav;
	}

	@PostMapping("/addProduct")
	public ModelAndView addProduct(@ModelAttribute Product product) {
		ModelAndView mav = new ModelAndView();
		productRepo.put(product.getId(), product);
		mav.addObject("productList", productRepo.values());
		mav.setViewName("home");
		return mav;
	}

	@GetMapping("/edit/{id}")
	public ModelAndView editProductById(@PathVariable String id) {
		ModelAndView mav = new ModelAndView();
		Product product =  productRepo.get(id);
		mav.addObject("editProduct", product);
		mav.setViewName("editProduct");
		return mav;
	}
	
	@RequestMapping("/delete/{id}")
	public ModelAndView deleteProductById(@PathVariable String id) {
		productRepo.remove(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("productList", productRepo.values());
		mav.setViewName("home");
		return mav;
	}
	
	@PostMapping(value = "/products")
	public ResponseEntity<Object> createProduct(@RequestBody Product product) {
		productRepo.put(product.getId(), product);
		return new ResponseEntity<>("Product is created successfully", HttpStatus.CREATED);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/products")
	public ResponseEntity<Object> getProducts(HttpServletRequest request) {
		Collection<Product> listProd = productRepo.values();
		request.setAttribute("productList", listProd);
		return new ResponseEntity<>(listProd, HttpStatus.OK);
	}

	

	@RequestMapping(value = "/products/{id}", method = RequestMethod.GET)
	public ResponseEntity<Object> getProductById(@PathVariable String id) {
		Product product = productRepo.get(id);
		if (product != null)
			return new ResponseEntity<Object>("Product Detail is :" + product.getId() + " and " + product.getName(),
					HttpStatus.OK);
		else
			return new ResponseEntity<Object>("Product Not Found", HttpStatus.OK);
	}

	@PutMapping("/products/{id}")
	public ResponseEntity<Object> updateProduct(@PathVariable String id, @RequestBody Product product) {
		productRepo.remove(id);
		product.setId(id);
		productRepo.put(id, product);
		return new ResponseEntity<Object>("Product is updated successsfully", HttpStatus.OK);
	}

	@RequestMapping(value = "/products/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Object> deleteProduct(@PathVariable("id") String id) {
		productRepo.remove(id);
		return new ResponseEntity<Object>("Product Deleted Successfully", HttpStatus.OK);
	}

	@RequestMapping("/hello")
	public ModelAndView hello() {
		return new ModelAndView("Hello");
	}
}
