package hirs.structs.converters;

/**
 * Exceptions to be thrown when using a {@link StructConverter}.
 */
public class StructConversionException extends RuntimeException {

    /**
     * Constructor for generating a conversion exception that is not a result of another exception.
     *
     * @param message reason for the exception
     */
    public StructConversionException(final String message) {
        super(message);
    }

    /**
     * Constructor for generating a struct marshalling exception that has both a message and a root
     * cause.
     *
     * @param message reason for the exception
     * @param cause   root cause
     */
    public StructConversionException(final String message, final Exception cause) {
        super(message, cause);
    }
}
