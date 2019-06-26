package com.utilities;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.core.Document;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.html.Anchor;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.internal.MessageDigestUtil;
import com.vaadin.flow.server.StreamResource;

import org.apache.commons.io.IOUtils;

/**
 * TriceraFileReader
 */
public class TriceraFileReader {
    private Document document;

    public TriceraFileReader() {
        
    }

    public Component createComponent(String mimeType, String fileName,
            InputStream stream) {
        System.out.println("TriceraFileReader.createComponent() : mimeType = " + mimeType);
        if (mimeType.startsWith("text")) {
            String text = "";
            String urlFileName = fileName.replace(" ", "%20");
            try {
                text = IOUtils.toString(stream, "UTF-8");
                document = new Document(fileName, text, 0, "Documents/" + fileName);
            } catch (IOException e) {
                System.out.println("TriceraFileReader.createComponent() : IOException e = " + e.toString());
                text = "exception reading stream";
            }
            // Not yet working
            Anchor docLink = new Anchor("Documents/" + urlFileName + "", fileName);
            docLink.getElement().setAttribute("download", "Documents/" + urlFileName + "");
            docLink.getElement().setAttribute("target","_blank");
            return docLink ;
        } else if (mimeType.startsWith("image")) {
            Image image = new Image();
            try {

                byte[] bytes = IOUtils.toByteArray(stream);
                image.getElement().setAttribute("src", new StreamResource(
                        fileName, () -> new ByteArrayInputStream(bytes)));
                try (ImageInputStream in = ImageIO.createImageInputStream(
                        new ByteArrayInputStream(bytes))) {
                    final Iterator<ImageReader> readers = ImageIO
                            .getImageReaders(in);
                    if (readers.hasNext()) {
                        ImageReader reader = readers.next();
                        try {
                            reader.setInput(in);
                            image.setWidth("60%");
                            image.setHeight("60%");
                            image.setMaxWidth("400px");
                        } finally {
                            reader.dispose();
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            return image;
        }
        Div content = new Div();
        String text = String.format("Mime type: '%s'\nSHA-256 hash: '%s'",
                mimeType, MessageDigestUtil.sha256(stream.toString()));
        content.setText(text);
        return content;

}

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}